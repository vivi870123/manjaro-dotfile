" Automatically generated packer.nvim plugin loader code

lua << END
local plugins = {
  ["BetterLua.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/BetterLua.vim"
  },
  ["Dockerfile.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim"
  },
  ["auto-git-diff"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/auto-git-diff"
  },
  ["calendar.vim"] = {
    load_after = {
      vimwiki = true
    },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/calendar.vim"
  },
  ["committia.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/committia.vim"
  },
  ["csscomplete.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/csscomplete.vim"
  },
  ["csv.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/csv.vim"
  },
  ["echodoc.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/echodoc.vim"
  },
  ["goyo.vim"] = {
    after = { "limelight.vim" },
    commands = { "Goyo" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/goyo.vim"
  },
  ["html5.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/html5.vim"
  },
  ["i3config.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/i3config.vim"
  },
  indentLine = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/indentLine"
  },
  ["iron.nvim"] = {
    commands = { "IronRepl", "IronWatchCurrentFile", "IronSend", "IronFocus" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/iron.nvim"
  },
  ["jsonc.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/jsonc.vim"
  },
  ["limelight.vim"] = {
    commands = { "Limelight" },
    load_after = {
      ["goyo.vim"] = true
    },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/limelight.vim"
  },
  ["logstash.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/logstash.vim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    config = { 'vim.api.nvim_command("doautocmd BufEnter")' },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  mpvim = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/mpvim"
  },
  ["nginx.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/nginx.vim"
  },
  ["nlua.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/nlua.nvim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["pgsql.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/pgsql.vim"
  },
  phpactor = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/phpactor"
  },
  ["python-syntax"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/python-syntax"
  },
  ["python_match.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/python_match.vim"
  },
  rainbow = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/rainbow"
  },
  ["requirements.txt.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/requirements.txt.vim"
  },
  ["rust.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/rust.vim"
  },
  ["scss-syntax.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/scss-syntax.vim"
  },
  sniphpets = {
    load_after = {
      ultisnips = true
    },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/sniphpets"
  },
  ["swift.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/swift.vim"
  },
  ["syntax-vim-ex"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/syntax-vim-ex"
  },
  ultisnips = {
    after = { "sniphpets" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/ultisnips"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vim-css3-syntax"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-css3-syntax"
  },
  ["vim-dadbod-ui"] = {
    commands = { "DBUIToggle", "DBUIAddConnection", "DBUI", "DBUIFindBuffer", "DBUIRenameBuffer" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-dadbod-ui"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make", "Focus", "Start" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-dispatch"
  },
  ["vim-doge"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-doge"
  },
  ["vim-fish"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-fish"
  },
  ["vim-floaterm"] = {
    commands = { "FloatermToggle" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-floaterm"
  },
  ["vim-fugitive"] = {
    commands = { "Gpull", "Gpush", "Gstatus" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-fugitive"
  },
  ["vim-gfm-syntax"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-gfm-syntax"
  },
  ["vim-git"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-git"
  },
  ["vim-gitgutter"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-gitgutter"
  },
  ["vim-graphql"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-graphql"
  },
  ["vim-helm"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-helm"
  },
  ["vim-jsdoc"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-jsdoc"
  },
  ["vim-json"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-json"
  },
  ["vim-less"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-less"
  },
  ["vim-log-highlighting"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-log-highlighting"
  },
  ["vim-markdown"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-markdown"
  },
  ["vim-matchup"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-matchup"
  },
  ["vim-mustache-handlebars"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-mustache-handlebars"
  },
  ["vim-node"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-node"
  },
  ["vim-pug"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-pug"
  },
  ["vim-python-pep8-indent"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-python-pep8-indent"
  },
  ["vim-ruby"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-ruby"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-startuptime"
  },
  ["vim-stylus"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-stylus"
  },
  ["vim-test"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-test"
  },
  ["vim-tmux"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-tmux"
  },
  ["vim-toml"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vim-toml"
  },
  vimagit = {
    commands = { "Magit", "MagitOnly" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vimagit"
  },
  vimwiki = {
    after = { "calendar.vim" },
    commands = { "VimwikiIndex", "VimwikiUISelect" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vimwiki"
  },
  ["vista.vim"] = {
    commands = { "Vista" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/vista.vim"
  },
  ["zinit-vim-syntax"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/chris/.local/share/nvim/site/pack/packer/opt/zinit-vim-syntax"
  }
}

local function handle_bufread(names)
  for _, name in ipairs(names) do
    local path = plugins[name].path
    for _, dir in ipairs({ 'ftdetect', 'ftplugin', 'after/ftdetect', 'after/ftplugin' }) do
      if #vim.fn.finddir(dir, path) > 0 then
        vim.cmd('doautocmd BufRead')
        return
      end
    end
  end
end

_packer_load = nil

local function handle_after(name, before)
  local plugin = plugins[name]
  plugin.load_after[before] = nil
  if next(plugin.load_after) == nil then
    _packer_load({name}, {})
  end
end

_packer_load = function(names, cause)
  local some_unloaded = false
  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      some_unloaded = true
      break
    end
  end

  if not some_unloaded then return end

  local fmt = string.format
  local del_cmds = {}
  local del_maps = {}
  for _, name in ipairs(names) do
    if plugins[name].commands then
      for _, cmd in ipairs(plugins[name].commands) do
        del_cmds[cmd] = true
      end
    end

    if plugins[name].keys then
      for _, key in ipairs(plugins[name].keys) do
        del_maps[key] = true
      end
    end
  end

  for cmd, _ in pairs(del_cmds) do
    vim.cmd('silent! delcommand ' .. cmd)
  end

  for key, _ in pairs(del_maps) do
    vim.cmd(fmt('silent! %sunmap %s', key[1], key[2]))
  end

  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      vim.cmd('packadd ' .. name)
      vim._update_package_paths()
      if plugins[name].config then
        for _i, config_line in ipairs(plugins[name].config) do
          loadstring(config_line)()
        end
      end

      if plugins[name].after then
        for _, after_name in ipairs(plugins[name].after) do
          handle_after(after_name, name)
          vim.cmd('redraw')
        end
      end

      plugins[name].loaded = true
    end
  end

  handle_bufread(names)

  if cause.cmd then
    local lines = cause.l1 == cause.l2 and '' or (cause.l1 .. ',' .. cause.l2)
    vim.cmd(fmt('%s%s%s %s', lines, cause.cmd, cause.bang, cause.args))
  elseif cause.keys then
    local keys = cause.keys
    local extra = ''
    while true do
      local c = vim.fn.getchar(0)
      if c == 0 then break end
      extra = extra .. vim.fn.nr2char(c)
    end

    if cause.prefix then
      local prefix = vim.v.count and vim.v.count or ''
      prefix = prefix .. '"' .. vim.v.register .. cause.prefix
      if vim.fn.mode('full') == 'no' then
        if vim.v.operator == 'c' then
          prefix = '' .. prefix
        end

        prefix = prefix .. vim.v.operator
      end

      vim.fn.feedkeys(prefix, 'n')
    end

    -- NOTE: I'm not sure if the below substitution is correct; it might correspond to the literal
    -- characters \<Plug> rather than the special <Plug> key.
    vim.fn.feedkeys(string.gsub(string.gsub(cause.keys, '^<Plug>', '\\<Plug>') .. extra, '<[cC][rR]>', '\r'))
  elseif cause.event then
    vim.cmd(fmt('doautocmd <nomodeline> %s', cause.event))
  elseif cause.ft then
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeplugin', cause.ft))
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeindent', cause.ft))
  end
end

-- Runtimepath customization

-- Pre-load configuration
-- Post-load configuration
-- Conditional loads
-- Load plugins in order defined by `after`
vim._update_package_paths()
END

function! s:load(names, cause) abort
call luaeval('_packer_load(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads
command! -nargs=* -range -bang -complete=file Make call s:load(['vim-dispatch'], { "cmd": "Make", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file DBUIRenameBuffer call s:load(['vim-dadbod-ui'], { "cmd": "DBUIRenameBuffer", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file DBUIFindBuffer call s:load(['vim-dadbod-ui'], { "cmd": "DBUIFindBuffer", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file VimwikiIndex call s:load(['vimwiki'], { "cmd": "VimwikiIndex", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Dispatch call s:load(['vim-dispatch'], { "cmd": "Dispatch", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file IronFocus call s:load(['iron.nvim'], { "cmd": "IronFocus", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Start call s:load(['vim-dispatch'], { "cmd": "Start", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Gpull call s:load(['vim-fugitive'], { "cmd": "Gpull", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Vista call s:load(['vista.vim'], { "cmd": "Vista", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file FloatermToggle call s:load(['vim-floaterm'], { "cmd": "FloatermToggle", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file MagitOnly call s:load(['vimagit'], { "cmd": "MagitOnly", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Magit call s:load(['vimagit'], { "cmd": "Magit", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file StartupTime call s:load(['vim-startuptime'], { "cmd": "StartupTime", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Limelight call s:load(['limelight.vim'], { "cmd": "Limelight", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Goyo call s:load(['goyo.vim'], { "cmd": "Goyo", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file DBUI call s:load(['vim-dadbod-ui'], { "cmd": "DBUI", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Gstatus call s:load(['vim-fugitive'], { "cmd": "Gstatus", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file UndotreeToggle call s:load(['undotree'], { "cmd": "UndotreeToggle", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file VimwikiUISelect call s:load(['vimwiki'], { "cmd": "VimwikiUISelect", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file IronRepl call s:load(['iron.nvim'], { "cmd": "IronRepl", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file DBUIAddConnection call s:load(['vim-dadbod-ui'], { "cmd": "DBUIAddConnection", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file IronWatchCurrentFile call s:load(['iron.nvim'], { "cmd": "IronWatchCurrentFile", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Gpush call s:load(['vim-fugitive'], { "cmd": "Gpush", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file MarkdownPreview call s:load(['markdown-preview.nvim'], { "cmd": "MarkdownPreview", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file DBUIToggle call s:load(['vim-dadbod-ui'], { "cmd": "DBUIToggle", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Focus call s:load(['vim-dispatch'], { "cmd": "Focus", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file IronSend call s:load(['iron.nvim'], { "cmd": "IronSend", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })

" Keymap lazy-loads

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  au FileType gitcommit ++once call s:load(['vim-git'], { "ft": "gitcommit" })
  au FileType gitrebase ++once call s:load(['vim-git', 'auto-git-diff'], { "ft": "gitrebase" })
  au FileType portfile ++once call s:load(['mpvim'], { "ft": "portfile" })
  au FileType python ++once call s:load(['vim-doge', 'rainbow', 'python_match.vim', 'indentLine', 'python-syntax', 'vim-python-pep8-indent'], { "ft": "python" })
  au FileType nginx ++once call s:load(['nginx.vim'], { "ft": "nginx" })
  au FileType docker-compose ++once call s:load(['Dockerfile.vim'], { "ft": "docker-compose" })
  au FileType stylus ++once call s:load(['vim-stylus'], { "ft": "stylus" })
  au FileType lua ++once call s:load(['BetterLua.vim', 'rainbow', 'indentLine', 'nlua.nvim'], { "ft": "lua" })
  au FileType bash ++once call s:load(['rainbow', 'indentLine'], { "ft": "bash" })
  au FileType gitconfig ++once call s:load(['vim-git'], { "ft": "gitconfig" })
  au FileType Dockerfile ++once call s:load(['Dockerfile.vim'], { "ft": "Dockerfile" })
  au FileType yaml ++once call s:load(['rainbow', 'indentLine'], { "ft": "yaml" })
  au FileType json ++once call s:load(['vim-json'], { "ft": "json" })
  au FileType pug ++once call s:load(['vim-pug'], { "ft": "pug" })
  au FileType php ++once call s:load(['vim-doge', 'rainbow', 'indentLine', 'phpactor', 'vim-test'], { "ft": "php" })
  au FileType vim ++once call s:load(['rainbow', 'syntax-vim-ex', 'indentLine'], { "ft": "vim" })
  au FileType html ++once call s:load(['rainbow', 'html5.vim', 'indentLine', 'vim-mustache-handlebars'], { "ft": "html" })
  au FileType typescript ++once call s:load(['vim-doge', 'rainbow', 'indentLine'], { "ft": "typescript" })
  au FileType log ++once call s:load(['vim-log-highlighting'], { "ft": "log" })
  au FileType jsonc ++once call s:load(['jsonc.vim'], { "ft": "jsonc" })
  au FileType handlebars ++once call s:load(['vim-mustache-handlebars'], { "ft": "handlebars" })
  au FileType logstash ++once call s:load(['logstash.vim'], { "ft": "logstash" })
  au FileType swift ++once call s:load(['swift.vim'], { "ft": "swift" })
  au FileType less ++once call s:load(['vim-less'], { "ft": "less" })
  au FileType sass ++once call s:load(['scss-syntax.vim'], { "ft": "sass" })
  au FileType csv ++once call s:load(['csv.vim'], { "ft": "csv" })
  au FileType scss ++once call s:load(['scss-syntax.vim'], { "ft": "scss" })
  au FileType pgsql ++once call s:load(['pgsql.vim'], { "ft": "pgsql" })
  au FileType toml ++once call s:load(['vim-toml'], { "ft": "toml" })
  au FileType mustache ++once call s:load(['vim-mustache-handlebars'], { "ft": "mustache" })
  au FileType ruby ++once call s:load(['vim-ruby'], { "ft": "ruby" })
  au FileType fish ++once call s:load(['vim-fish'], { "ft": "fish" })
  au FileType jade ++once call s:load(['vim-pug'], { "ft": "jade" })
  au FileType markdown ++once call s:load(['vim-markdown', 'vim-gfm-syntax', 'indentLine'], { "ft": "markdown" })
  au FileType requirements ++once call s:load(['requirements.txt.vim'], { "ft": "requirements" })
  au FileType rust ++once call s:load(['rust.vim'], { "ft": "rust" })
  au FileType i3config ++once call s:load(['i3config.vim'], { "ft": "i3config" })
  au FileType tmux ++once call s:load(['vim-tmux'], { "ft": "tmux" })
  au FileType javascript ++once call s:load(['vim-doge', 'vim-jsdoc', 'rainbow', 'indentLine', 'vim-graphql', 'vim-node'], { "ft": "javascript" })
  au FileType css ++once call s:load(['rainbow', 'csscomplete.vim', 'indentLine', 'vim-css3-syntax'], { "ft": "css" })
  au FileType helm ++once call s:load(['vim-helm'], { "ft": "helm" })
  au FileType typescriptreact ++once call s:load(['vim-doge', 'rainbow', 'indentLine'], { "ft": "typescriptreact" })
  au FileType javascriptreact ++once call s:load(['vim-jsdoc', 'rainbow', 'indentLine', 'vim-graphql', 'vim-node'], { "ft": "javascriptreact" })
  au FileType tex ++once call s:load(['rainbow', 'indentLine'], { "ft": "tex" })
  au FileType zsh ++once call s:load(['indentLine', 'zinit-vim-syntax'], { "ft": "zsh" })
  " Event lazy-loads
  au CompleteDone ++once call s:load(['echodoc.vim'], { "event": "CompleteDone" })
  au FileType ++once call s:load(['nvim-colorizer.lua', 'ultisnips', 'indentLine'], { "event": "FileType" })
  au VimEnter * ++once call s:load(['vim-matchup'], { "event": "VimEnter *" })
  au BufReadPost ++once call s:load(['committia.vim'], { "event": "BufReadPost" })
augroup END
