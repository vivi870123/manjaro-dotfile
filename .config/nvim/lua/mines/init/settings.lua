local api = vim.api
local nvim_set_keymap = api.nvim_set_keymap

local HOME_PATH = os.getenv("HOME")
local VIM_PATH  = os.getenv("HOME") .. '/.config/nvim'
local DATA_PATH = os.getenv("HOME") .. '/.cache/nvim'

vim.api.nvim_command [[let $VIM_PATH = fnamemodify(resolve(expand('<sfile>:p')), ':h:h') . '/nvim']]
vim.api.nvim_command [[let $DATA_PATH = expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~/.cache') . '/nvim')]]

-- vim.fn.execute('luafile ' .. vim.fn.stdpath('config') .. '/lua/mines/plugins.lua')
vim.cmd [[execute 'luafile ' . stdpath('config') . '/lua/mines/plugins.lua']]
vim.api.nvim_command [[command! PackerInstall packadd packer.nvim | lua require('mines/plugins').install()]]
vim.api.nvim_command [[command! PackerUpdate packadd packer.nvim  | lua require('mines/plugins').update()]]
vim.api.nvim_command [[command! PackerSync packadd packer.nvim    | lua require('mines/plugins').sync()]]
vim.api.nvim_command [[command! PackerClean packadd packer.nvim   | lua require('mines/plugins').clean()]]
vim.api.nvim_command [[command! PackerCompile packadd packer.nvim | lua require('mines/plugins').compile('~/.config/nvim/plugin/packer_load.vim')]]

local initial_mappings = function()
  -- disable ex mode
  nvim_set_keymap('n', 'Q', '', {})

  nvim_set_keymap('n', 's', '', {})
  nvim_set_keymap('n', ',', '', {})
  nvim_set_keymap('x', ',', '', {})
  nvim_set_keymap('n', ';', '', {})
  nvim_set_keymap('x', ';', '', {})
  nvim_set_keymap('n', 'm', '', {})
  nvim_set_keymap('x', 'm', '', {})

  -- Remap the leader key.
  nvim_set_keymap('n', '<Space>', '', {})
  nvim_set_keymap('x', '<Space>', '', {})
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ','
end

local global_vars = function()
  vim.g.python_host_skip_check = 1
  vim.g.python3_host_skip_check = 1
  vim.g.python_host_prog = vim.fn.exepath('python2')
  vim.g.python3_host_prog = vim.fn.exepath('python3')
  vim.g.node_host_prog = vim.fn.exepath('neovim-node-host')
  vim.g.ruby_host_prog = vim.fn.exepath('neovim-ruby-host')

  vim.g.c_syntax_for_h = 1
  vim.g.did_install_default_menus = 1
  vim.g.loaded_2html_plugin = 1
  vim.g.loaded_getscript = 1
  vim.g.loaded_getscriptPlugin = 1
  vim.g.loaded_gzip = 1
  vim.g.loaded_logiPat = 1
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwFileHandlers  = 1
  vim.g.loaded_netrwPlugin        = 1
  vim.g.loaded_netrwSettings      = 1
  vim.g.loaded_matchit = 1
  vim.g.loaded_matchparen = 1
  vim.g.netrw_nogx = 1 -- disable netrw's gx mapping.
  vim.g.loaded_rrhelper = 1
  vim.g.loaded_shada_plugin = 1
  vim.g.loaded_tar = 1
  vim.g.loaded_tarPlugin = 1
  vim.g.loaded_tutor_mode_plugin = 1
  vim.g.loaded_vimball = 1
  vim.g.loaded_vimballPlugin = 1
  vim.g.loaded_zip = 1
  vim.g.loaded_zipPlugin = 1

  -- Internal Plugin Settings
  vim.g.PHP_removeCRwhenUnix  = 0
  vim.g.PHP_default_indenting = 0
  vim.g.PHP_outdentphpescape  = 0 -- Don't outdent the <?php tags to the first column
  vim.g.php_htmlInStrings     = 0 -- neat! :h php.vim
  vim.g.php_baselib           = 1 --  highlight php builtin functions
  vim.g.php_noShortTags       = 1
  vim.g.php_syncmethod        = 10 -- :help :syn-sync https://stackoverflow.com/a/30732393/557215
  vim.g.python_highlight_all = 1
  vim.g.vimsyntax_noerror = 1
  vim.g.vim_indent_cont = [[&shiftwidth]]
  vim.g.is_bash = 1
  vim.g.SimpleJsIndenter_BriefMode = 1
  vim.g.SimpleJsIndenter_CaseIndentLevel = -1
end

local global_options = function()
  -- General
  vim.wo.signcolumn = 'yes'
  vim.o.modeline = true
  vim.o.report = 0
  vim.o.errorbells = false
  vim.o.visualbell = true
  vim.o.hidden = true
  vim.o.autoread = true
  vim.o.fileformats = 'unix,dos,mac'
  vim.o.path = '.,**'
  vim.o.virtualedit = 'block'
  vim.o.synmaxcol = 400
  vim.o.formatoptions = 'cqjljn'
  vim.o.clipboard = 'unnamedplus'
  vim.o.emoji = false

  -- Vim Directories
  vim.o.undofile = true
  vim.o.undodir = DATA_PATH .. '/undo'
  vim.o.swapfile = false
  vim.o.backup = false
  vim.o.writebackup = false
  vim.o.viewdir = DATA_PATH .. '/view'

  -- Wildmenu
  vim.o.wildmenu = false

  -- History Saving
  vim.o.history = 1000
  vim.o.shada="'300,<50,@100,s10,h"

  -- Tabs & Indent
  vim.o.textwidth=80
  vim.o.expandtab = false
  vim.o.tabstop = 2
  vim.o.softtabstop = 2
  vim.o.shiftwidth = 2
  vim.o.smarttab = true
  vim.o.autoindent = true
  vim.o.smartindent = true
  vim.o.shiftround = false

  -- Timing
  vim.o.timeout = true
  vim.o.ttimeout = true
  vim.o.timeoutlen = 500
  vim.o.updatetime = 200
  vim.o.ttimeoutlen = 10

  -- Searching
  vim.oignorecase = true
  vim.o.smartcase = true
  vim.o.infercase = true
  vim.o.incsearch = true
  vim.o.inccommand = 'split'
  vim.o.complete = '.,b,w,u'

  -- Behaviour
  vim.wo.spell = false
  vim.wo.wrap = false
  vim.wo.linebreak = true
  vim.o.startofline = false
  vim.o.whichwrap = 'b,s,h,l,<,>,[,],~'
  vim.o.splitbelow = true
  vim.o.splitright = true
  vim.o.switchbuf = 'useopen,usetab,vsplit'
  vim.o.backspace = 'indent,eol,start'
  vim.o.diffopt = 'filler,iwhite'
  vim.o.completeopt = 'menuone,noinsert,noselect'
  vim.o.grepprg = (function()
    if vim.fn.executable("rg") then
      return [[rg --vimgrep --hidden --no-ignore-vcs --smart-case]]
    end
    if vim.fn.executable("ag") then
      return [[ag --vimgrep --hidden --skip-vcs-ignores --smart-case]]
    end
    return vim.o.grepprg
  end)()
  vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
  vim.o.scrollback = 100000
end

local ui_options = function()
  if vim.fn.exists('+termguicolors') then
    vim.api.nvim_command [[let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"]]
    vim.api.nvim_command [[let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"]]

    -- enable italic font
    vim.api.nvim_command [[let &t_ZH = "\e[3m"]]
    vim.api.nvim_command [[let &t_ZR = "\e[23m"]]
    vim.o.termguicolors = true
  end

  vim.o.showcmd = false
  vim.o.showmode = false
  vim.o.laststatus = 2
  vim.o.ruler = false
  vim.o.rulerformat = [[%-14.(%l,%c   %o%)]]
  vim.o.mouse = 'nv'
  vim.o.shortmess = 'filnxtToOFIc'
  vim.o.scrolloff = 2
  vim.o.sidescrolloff = 5
  vim.o.number = false
  vim.o.list = false
  vim.o.showtabline = 2
  vim.o.winwidth = 30
  vim.o.winminwidth = 10
  vim.o.winheight = 2
  vim.o.winminheight = 1
  vim.o.pumheight = 15
  vim.o.helpheight = 12
  vim.o.previewheight = 12
  vim.o.cmdheight = 2
  vim.o.cmdwinheight = 3
  vim.o.equalalways = true
  vim.o.display = 'lastline'
  require('mines/init/colors').setup()
end

local folding = function()
  local fold_method = 'indent'
  local foldexpr = 'nvim_treesitter#foldexpr()'

  vim.o.foldlevelstart = 99
  vim.wo.foldexpr = foldexpr
  vim.wo.foldmethod = fold_method
  -- vim.schedule(function()
  -- 	helpers.augroup('folding_config', {
  -- 		{events = {'BufEnter'}; targets = {'*'}; command = [[setlocal foldmethod=]] .. fold_method};
  -- 	})
  -- end)
end

initial_mappings()
global_options()
ui_options()
folding()
global_vars()
