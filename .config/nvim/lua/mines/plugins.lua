local packer = nil

local function init()
  if packer == nil then
    packer = require('packer')
    packer.init()
  end

  local use = packer.use
  packer.reset()


  -- Startup
  use {'wbthomason/packer.nvim', opt = true}
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  use {'dstein64/vim-startuptime', opt = true, cmd = 'StartupTime'}
  use 'mhinz/vim-startify'
  use 'editorconfig/editorconfig-vim'
  use 'liuchengxu/vim-which-key'
  use 'justinmk/vim-dirvish'
  use 'jiangmiao/auto-pairs'
  use {'norcalli/nvim-colorizer.lua', opt = true, event = 'FileType'}
  use 'skywind3000/asyncrun.vim'
  use 'antoinemadec/FixCursorHold.nvim'


  -- Languages
  use {'hail2u/vim-css3-syntax', ft = 'css'}
  use {'othree/csscomplete.vim', ft = 'css'}
  use {'cakebaker/scss-syntax.vim', ft = {'scss', 'sass'}}
  use {'groenewege/vim-less', ft = 'less'}
  use {'iloginow/vim-stylus', ft = 'stylus'}
  use {'mustache/vim-mustache-handlebars', ft = {'html', 'mustache', 'handlebars'}}
  use {'digitaltoad/vim-pug', ft = {'pug', 'jade'}}
  use {'othree/html5.vim', ft = 'html'}

  use {
    'plasticboy/vim-markdown',
    ft = 'markdown',
    requires = {
      {'rhysd/vim-gfm-syntax', ft = 'markdown'}
    }
  }
 use 'dkarter/bullets.vim'

  -- TypeScript & JavaScript
  use 'leafgarland/typescript-vim'
  use 'peitalin/vim-jsx-typescript'
  use {'heavenshell/vim-jsdoc', ft = {'javascript', 'javascriptreact'}}
  use {'jparise/vim-graphql', ft = {'javascript', 'javascriptreact'}}
  use {'moll/vim-node', ft = {'javascript', 'javascriptreact'}}
  use {'elzr/vim-json', ft = 'json'}
  use {'neoclide/jsonc.vim', ft = 'jsonc'}

  -- PHP related
  use {'StanAngeloff/php.vim'}
  use 'stephpy/vim-php-cs-fixer'
  use {'janko-m/vim-test', ft = 'php'}
  use {'kkoomen/vim-doge',  ft = {'php', 'javascript', 'typescript', 'typescriptreact', 'python'}}

  -- Python related
  use {'vim-python/python-syntax', ft = 'python'}
  use {'Vimjas/vim-python-pep8-indent', ft = 'python'}
  use {'vim-scripts/python_match.vim', ft = 'python'}
  use {'raimon49/requirements.txt.vim', ft = 'requirements'}

  -- misc
  use {'zinit-zsh/zinit-vim-syntax', ft = 'zsh'}
  use {'euclidianAce/BetterLua.vim', ft = 'lua'}
  use {'vim-jp/syntax-vim-ex', ft = 'vim'}
  use {'tjdevries/nlua.nvim', ft = 'lua'}
  use {'vim-ruby/vim-ruby', ft = 'ruby'}
  use {'keith/swift.vim', ft = 'swift'}
  use {'rust-lang/rust.vim', ft = 'rust'}
  use {'chrisbra/csv.vim', ft = 'csv'}
  use {'tpope/vim-git', ft = {'gitcommit', 'gitrebase', 'gitconfig'}}
  use {'ekalinin/Dockerfile.vim', ft = {'Dockerfile', 'docker-compose'}}
  use {'tmux-plugins/vim-tmux', ft = 'tmux'}
  use {'MTDL9/vim-log-highlighting', ft = 'log'}
  use {'cespare/vim-toml', ft = 'toml'}
  use {'mboughaba/i3config.vim', ft = 'i3config'}
  use {'dag/vim-fish', ft = 'fish'}
  use {'jstrater/mpvim', ft = 'portfile'}
  use {'robbles/logstash.vim', ft = 'logstash'}
  use {'lifepillar/pgsql.vim', ft = 'pgsql'}
  use {'chr4/nginx.vim', ft = 'nginx'}
  use {'towolf/vim-helm', ft = 'helm'}


  -- Commands
  use 'kamykn/popup-menu.nvim'
  use 'kamykn/spelunker.vim'
  use 'AndrewRadev/switch.vim'
  use 'arthurxavierx/vim-caser'
  use 'junegunn/vim-easy-align'
  use {'mbbill/undotree', opt = true, cmd = {'UndotreeToggle'}}
  use 'machakann/vim-highlightedundo'
  use {'voldikss/vim-floaterm', opt = true, cmd = {'FloatermToggle'}}
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use 'MattesGroeger/vim-bookmarks'
  use {'hkupty/iron.nvim', opt = true, cmd = {'IronRepl', 'IronWatchCurrentFile', 'IronSend', 'IronFocus'}}

  use {
    'iamcco/markdown-preview.nvim',
    config = 'vim.api.nvim_command("doautocmd BufEnter")',
    run = 'cd app && yarn install',
    cmd = 'MarkdownPreview',
    requires = {
      'mzlogin/vim-markdown-toc',
      cmd = { 'GenTocGFM', 'GenTocRedcarpet', 'GenTocGitLab', 'UpdateToc'}
    }
  }

  use {
    'vimwiki/vimwiki',
    opt = true,
    cmd = {'VimwikiIndex', 'VimwikiUISelect'},
    requires = {'itchyny/calendar.vim', cmd = 'Calendar'}
  }


  -- Git
  use {'tpope/vim-fugitive', cmd = {'Gpull', 'Gpush', 'Gstatus'}}
  use {'airblade/vim-gitgutter', opt = true}
  use {'jreybert/vimagit', opt = true, cmd = {'Magit', 'MagitOnly'}}
  use {'hotwatermorning/auto-git-diff', opt = true, ft = 'gitrebase'}


  -- Interface
  use 'haya14busa/is.vim'
  use 'haya14busa/vim-asterisk'
  use 'rhysd/clever-f.vim'

  use 'easymotion/vim-easymotion'
  use 'osyo-manga/vim-anzu'
  use {'rhysd/committia.vim', opt = true, event = 'BufReadPost'}
  use {'andymass/vim-matchup', opt = true, event = 'VimEnter *'}
  use {
    'luochen1990/rainbow',
    opt = true,
    ft = {'lua', 'php', 'bash', 'css', 'html', 'yaml', 'vim', 'tex', 'python', 'typescript', 'typescriptreact', 'javascript', 'javascriptreact'},
  }

  use {
    'yggdroot/indentLine',
    opt = true,
    event = 'FileType',
    ft = {'lua', 'php', 'zsh', 'bash', 'css', 'html', 'markdown', 'yaml', 'vim', 'tex', 'python', 'typescript', 'typescriptreact', 'javascript', 'javascriptreact'},
  }

  use {
    'junegunn/goyo.vim',
    opt = true,
    cmd = 'Goyo',
    requires = {
      {'junegunn/limelight.vim', opt = true, cmd = 'Limelight'}
    }
  }

  use {
    'itchyny/lightline.vim',
    requires = {
      'shinchu/lightline-gruvbox.vim',
      'josa42/vim-lightline-coc',
      'cocopon/lightline-hybrid.vim',
      'mengelbrecht/lightline-bufferline'
    }
  }

  use { 'Shougo/echodoc.vim', event =  'CompleteDone'}

  use {
    'kristijanhusak/vim-dadbod-ui',
    cmd = {'DBUIToggle', 'DBUIAddConnection', 'DBUI', 'DBUIFindBuffer', 'DBUIRenameBuffer'},
    requires = 'tpope/vim-dadbod'
  }

  -- Completions & code analysis
  use {
    'neoclide/coc.nvim',
    run = 'yarn install --frozen-lockfile',
    requires = {
      'antoinemadec/coc-fzf',
    }
  }

  use {
    'SirVer/ultisnips',
    opt = true,
    event = 'FileType',
    requires = {
      'sniphpets/sniphpets'
    }
  }

  use 'dense-analysis/ale'

  use {'prettier/vim-prettier', run = 'npm install'}

  use {
    'junegunn/fzf',
    run = './install --all',
    requires = {
      'junegunn/fzf.vim',
      {'yuki-ycino/fzf-preview.vim', run = 'yarn install'}
    }
  }
  use {'Tarmean/fzf-session.vim', requires = { 'tpope/vim-obsession'}}

  use 'gelguy/wilder.nvim'


  use {
    'phpactor/phpactor',
    ft = 'php',
    branch = 'master',
    run = 'composer install --no-dev -o'
  }

  use {'liuchengxu/vista.vim', cmd = 'Vista'}


  -- Operators & Text Objects
  use 'kana/vim-operator-user'
  use 'kana/vim-operator-replace'
  use 'kana/vim-textobj-user'
  use 'thinca/vim-textobj-between'
  use 'machakann/vim-textobj-delimited'
  use 'machakann/vim-sandwich'
  use 'AndrewRadev/splitjoin.vim'
  use 'AndrewRadev/dsf.vim'
  use 'AndrewRadev/sideways.vim'


  -- Colorschemes
  use 'tomasiser/vim-code-dark'
  use 'rafi/awesome-vim-colorschemes'
  use 'Rigellute/shades-of-purple.vim'
  use 'logico/typewriter-vim'
  use 'gruvbox-community/gruvbox'
  use 'arcticicestudio/nord-vim'
  use 'joshdick/onedark.vim'
  use 'junegunn/seoul256.vim'
  use 'lifepillar/vim-solarized8'
  use 'mhartington/oceanic-next'
  use 'nanotech/jellybeans.vim'

  use 'ryanoasis/vim-devicons'
end

local plugins = setmetatable({}, {
    __index = function(_, key)
      init()
      return packer[key]
    end
  })

return plugins
