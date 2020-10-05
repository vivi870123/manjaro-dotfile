-- Global api

local api_paths = {
  buf = 'mines/buffers';
  files = 'mines/files';
  git = 'mines/git';
  gitlens = 'mines/gitlens';
  grep = 'mines/grep';
  qf = 'mines/quickfix';
  term = 'mines/terminal';
  wk = 'mines/which_key';
  mappings = 'mines/utils/mappings';
  utils = {
    unique_id = 'mines/utils/unique_id';
    funcref = 'mines/utils/funcref';
    jobs = 'mines/utils/jobs';
  };
  fn = 'mines/utils/utils';
  window = 'mines/window';
  rx = {
    observable = 'mines/utils/observable';
    subscriber = 'mines/utils/subscriber';
    subscription = 'mines/utils/subscription';
  };
  project = 'mines/utils/project';
  fzf = 'mines/fzf';
  fs = 'mines/utils/fs';
}

local function setup_lookup_table(tbl, api, path)
  setmetatable(tbl, {
    __index = function(tbl, key)
      local api_path = api[key]
      local existing_api = rawget(tbl, key)

      if existing_api then return existing_api end

      if type(api_path) == 'table' then
        -- If a list then merge all modules into a single api
        if vim.tbl_islist(api_path) then
          local result = {}

          for _,path in ipairs(api_path) do
            result = vim.tbl_extend('force', result, require(path))
          end

          rawset(tbl, key, result)

          return result
        -- If a table then return the namespace that can lazily be looked up
        else
          local sub = {}

          rawset(tbl, key, sub)

          return setup_lookup_table(sub, api_path, path .. '.' .. key)
        end
      -- If a string then import that module
      elseif type(api_path) == 'string' then
        rawset(tbl, key, require(api_path))

        return rawget(tbl, key)
      else
        error("Could not find mines API path " .. path .. '.' .. key)
      end
    end
  })

  return tbl
end

-- Everything is exposed, lazily, as `mines`
mines = {
  -- Shorthand for commands
  command = vim.api.nvim_command;
  -- Easy way to expose nvim commands
  ex = setmetatable({}, {
    __index = function(tbl, key)
      local existing = rawget(tbl, key)

      if existing then return existing end

      local fn = function(...)
        local cmd = key

        for i = 1, select("#", ...) do
          cmd = cmd .. " " .. select(i, ...)
        end

        return vim.api.nvim_command(cmd)
      end

      rawset(tbl, key, fn)

      return fn
    end
  })
}

setup_lookup_table(mines, api_paths, 'mines')
