local vim = vim
local exists = vim.fn.exists

Ll = {}

-- Local vars {{{1
local FILENAME = vim.api.nvim_buf_get_name(0)
-- Script globals {{{2
local glyphs = {
  questionmark = '',
  tag = ' ',
  folder = ' ',
  line_no = "",
  vcs = "",
  branch = "",
  line = "☰",
  read_only = " ",
  modified = "  ",
  func = "ƒ ",
}

-- List of plugins/non-files for special handling
local special_filetypes = { -- {{{2
  dirvish = "DIRVISH",
  nerdtree = "NERD",
  netrw = "NETRW",
  defx = "DEFX",
  vista = "VISTA",
  vista_kind = "VISTA",
  tagbar = "TAGS",
  undotree = "UNDO",
  qf = "",
  ["coc-explorer"] = "EXPLORER",
  ["output=///info"] = "COC-INFO",
  magit = "MAGIT",
  vimfiler = "FILER",
  minpac = "PACK",
  packager = "PACK",
  packer = "PACK",
  fugitive = "FUGITIVE",
  startify = "STARTIFY",
}

Ll.mode_map = {
  n = {"NORMAL"},
  niI = {"NORMAL·CMD"},
  i = {"INSERT"},
  ic = {"INSERT"},
  ix = {"I·COMPL"},
  R = {"REPLACE"},
  v = {"VISUAL"},
  V = {"V·LINE"},
  ["\x16"] = {"V·BLOCK"},
  c = {"COMMAND"},
  s = {"SELECT"},
  S = {"S·LINE"},
  ["<C-s>"] = {"S·BLOCK"},
  t = {"TERMINAL"},
}

-- Component functions
function Ll.is_not_file() -- {{{2
  return special_filetypes[vim.bo.filetype] ~= nil or vim.bo.filetype == ""
end


function Ll.line_info() -- {{{2
  local filetype = vim.bo.filetype
  if filetype == 'help' then
    return glyphs.questionmark
  elseif filetype == 'dirvish' or filetype == 'coc-explorer' or filetype == 'defx' then
    return glyphs.folder
  elseif filetype == 'diff' or
    filetype == 'packer' or
    filetype == 'help' or
    filetype == 'magit' or
    filetype == 'undotree' or
    filetype == 'startify' or
    filetype == 'vista' or
    filetype == 'vista_kind' then
    return glyphs.tag
  end

  if Ll.is_not_file() then return "" end

  local line_ct = vim.api.nvim_buf_line_count(0)
  local pos = vim.api.nvim_win_get_cursor(0)
  local row = pos[1]
  -- local col = pos[2] + 1
  local row_pos = function()
    local max_digits = string.len(tostring(line_ct))
    return string.format("%" .. max_digits .. "d/%" .. max_digits .. "d",
                        row, line_ct)
  end
  -- return string.format("%3d%% %s %s %s :%3d", row * 100 / line_ct, glyphs.line, row_pos(), glyphs.line_no, col)
  return string.format("%3d%% %s %s", row * 100 / line_ct, glyphs.line, row_pos())
end

function Ll.vim_mode()
  local mode_key = vim.api.nvim_get_mode().mode
  local current_mode = Ll.mode_map[mode_key] or mode_key

  return special_filetypes[vim.bo.filetype] or current_mode[1]
end

function Ll.git_summary() -- {{{2
  -- Look for git hunk summary in this order:
  -- 1. coc-git
  -- 2. gitgutter
  -- 3. signify
  if exists("b:coc_git_status") == 1 then
    return " " .. vim.trim(vim.api.nvim_buf_get_var(0, "coc_git_status"))
  end
  local hunks = (function()
    return mines.fs.npcall(vim.fn.GitGutterGetHunkSummary) or mines.fs.npcall(vim.fn["sy#repo#get_stats"]) or {0, 0, 0}
  end)()
  local added = not not hunks[1] and hunks[1] ~= 0 and string.format("+%d ", hunks[1]) or ""
  local changed = not not hunks[2] and hunks[2] ~= 0 and string.format("~%d ", hunks[2]) or ""
  local deleted = not not hunks[3] and hunks[3] ~= 0 and string.format("-%d ", hunks[3]) or ""

  return " " .. added .. changed .. deleted
end

function Ll.git_branch() -- {{{2
  if vim.fn.exists("g:coc_git_status") == 1 then
    return string.gsub(vim.g.coc_git_status, "master", "")
  end

  local head = mines.fs.npcall(vim.fn.FugitiveHead)
  return head ~= "" and glyphs.branch .. " " .. head or ""
end

function Ll.git_status() -- {{{2
  local filetype = vim.bo.filetype
  if filetype == 'coc-explorer' or filetype == 'vista' or filetype == 'undotree' or filetype == 'magit' then
    return ""
  end

  if not Ll.is_not_file() then
    local branch = Ll.git_branch()
    local hunks = Ll.git_summary()
    if branch ~= "" then
      return string.format("%s%s%s", glyphs.vcs,
        branch:gsub("master", ""), hunks)
    end
  end
  return ""
end

function Ll.coc_status()
  local status = vim.g.coc_status

  if vim.fn.empty(status) then
    return ""
  end

  local regstatus = vim.fn.substitute(status,"TSC","Ⓣ ","")
  local statusbar= vim.fn.split(regstatus)

  if vim.bo.filetype == "go" then
    local gobar ="Ⓖ "
    vim.api.nvim_command(('call add(%s,%s)'):format(statusbar, gobar))
  end

  local s = vim.fn.join(statusbar," ")
  if vim.fn.empty(s) then
    return ""
  end

  return vim.fn.join({'❖', s})
end

function Ll.file_type() -- {{{2
  if Ll.is_not_file() then return "" end
  local filetype_glyph = mines.fs.npcall(function()
    return " " .. vim.fn.WebDevIconsGetFileTypeSymbol()
  end) or ""
  local python_venv = function()
    local venv = not vim.g.did_coc_loaded and
      (vim.bo.ft == "python" and
        string.basename(vim.env.VIRTUAL_ENV)) or ""
        return venv ~= "" and string.format(" (%s)", venv) or ""
    end

    local venv = python_venv() or ""
    return vim.bo.filetype .. filetype_glyph .. venv
end

function Ll.file_format() -- {{{2
  local fileformat = vim.bo.fileformat

  if Ll.is_not_file() or fileformat == "unix" then return "" end

  local fileformat_glyph = mines.fs.npcall(function()
    return " " .. vim.fn.WebDevIconsGetFileFormatSymbol()
  end) or ""
  return fileformat .. fileformat_glyph
end

function Ll.modified()
  if Ll.is_not_file() then
    return ''
  elseif vim.bo.modified then
    return glyphs.modified
  elseif vim.bo.modifiable then
    return '+'
  else
    return '-'
  end
end

function Ll.readonly()
  if vim.bo.filetype == "help" then
    return ""
  elseif vim.bo.readonly then
    return ""
  else
    return ""
  end
end

function Ll.lightLine_filename()
  return ('' ~= Ll.readonly() and Ll.readonly() .. ' ' or '') .. ('' ~= vim.fn.expand('%:t') and vim.fn.expand('%:t') or '')
end

function Ll.filename()
  local ft_glyph = mines.fs.npcall(function()
    return " " .. vim.fn.WebDevIconsGetFileTypeSymbol()
  end) or ""
  local icon = (vim.fn.strlen(vim.bo.filetype) and ' ' .. ft_glyph or ' no ft')
  local filename = Ll.lightLine_filename()

  if filename == '' then
    return ''
  end
  return vim.fn.join({filename, icon},'')
end

function Ll.file_name_active() -- {{{2
  if vim.bo.filetype == "qf" then
    return string.format("%s %s", "[Quickfix List]", vim.fn.getqflist({title = 1}).title or "")
  end
  if vim.bo.buftype == 'terminal' then
    return vim.fn.has('nvim') and vim.b.term_title .. ' (' .. vim.b.terminal_job_pid .. ')' or ''
  end

  if Ll.is_not_file() then return "" end

  local modified = Ll.modified()
  return vim.fn.empty(modified) and Ll.filename() or Ll.filename() .. ' ' .. modified
end

function Ll.file_encoding() -- {{{2
    return vim.bo.fileencoding ~= "utf-8" and vim.bo.fileencoding or ""
end

function Ll.file_size() -- {{{2
    local stat = vim.loop.fs_stat(FILENAME)
    local size = stat ~= nil and stat.size or 0
    return size > 0 and mines.fn.humanize_bytes(size) or ""
end

function Ll.current_tag() -- {{{2
    local coc_tag = (function()
        return vim.fn.exists("b:coc_current_function") == 1 and
                   vim.api.nvim_buf_get_var(0, "coc_current_function") or ""
    end)()
    -- return coc_tag or ""
    return coc_tag ~= "" and coc_tag or ""
end

function Ll.buffers()
  return vim.fn.winwidth(0) > 70 and vim.fn['lightline#bufferline#buffers']() or ""
end

local settings = {
  ['lightline#bufferline#show_number']  = 0,
  ['lightline#bufferline#unicode_symbols'] = 1,
  ['lightline#bufferline#shorten_path'] = 1,
  ['lightline#bufferline#enable_devicons'] = 1,
  ['lightline#bufferline#filename_modifier'] = ':p:t',
  ['lightline#bufferline#unnamed'] = '[No Name]',
  ['lightline#bufferline#read_only'] = '',
  ['lightline#bufferline#modified'] = ' ' .. vim.fn.nr2char(0xf444),

  ['lightline#ale#indicator_checking'] = vim.fn.nr2char(0xf110),
  ['lightline#ale#indicator_infos'] = vim.fn.nr2char(0xf129),
  ['lightline#ale#indicator_warnings'] = vim.fn.nr2char(0xf071),
  ['lightline#ale#indicator_errors'] = vim.fn.nr2char(0xf05e),

  lightline_hybrid_style = 'plain',
  lightline_gruvbox_style = 'hard_left',

  lightline = {
    colorscheme = 'hybrid',
    tabline = { left = {{"buffers"}}, right = {{"filesize"}}, },
    active = {
      left = {
        {"mode", "paste"},
        {"git_status"},
        {"filename"},
      },
      right = {
        {'anzu'},
        {"line_info"},
        {"fileencoding", "fileformat"},
        {"current_tag"},
        {"linter_errors", "linter_warnings", "linter_ok" },
        {"coc_status"},
      },
    },
    inactive = {
      right = { {"line_info"}, {"filetype", "fileencoding", "fileformat"}, },
    },
    component = {
      mode = "%{v:lua.Ll.vim_mode()}",
      filename = "%<%{v:lua.Ll.file_name_active()}",
      git_status = "%{v:lua.Ll.git_status()}",
      line_info = "%{v:lua.Ll.line_info()}",
      filetype = "%{v:lua.Ll.file_type()}",
      fileencoding = "%{v:lua.Ll.file_encoding()}",
      fileformat = "%{v:lua.Ll.file_format()}",
      filesize = "%{v:lua.Ll.file_size()}",
      current_tag = "%{v:lua.Ll.current_tag()}",
      coc_status = "%{v:lua.Ll.coc_status()}",
    },
    component_visible_condition = {
      filetype = "v:lua.Ll.file_type()",
      fileencoding = "v:Lua.ll.file_encoding()",
      fileformat = "v:lua.Ll.file_format()",
      coc_status = "v:lua.Ll.coc_status()",
    },
    component_expand = {
      anzu = 'anzu#search_status',
      buffers = "lightline#bufferline#buffers",
      linter_warnings = 'lightline#coc#warnings',
      linter_errors = 'lightline#coc#errors',
      linter_ok = 'lightline#coc#ok',
    },
    component_type = {
      readonly = "warning",
      buffers = "tabsel",
      linter_ok =       'right',
      linter_warnings = 'warning',
      linter_errors =   'error',
    },
    separator = { left = '', right = '' },
    subseparator = { left = '', right = '' }
  }
}


for k,v in pairs (settings) do
	vim.g[k] = v
end
