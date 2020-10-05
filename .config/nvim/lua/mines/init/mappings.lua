local vim = vim
local unimplemented = mines.mappings.unimplemented;

local function show_documentation()
  if vim.fn.index({ 'vim', 'lua', 'help' }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('help ' .. vim.fn.expand('<cword>'))
  else
    vim.api.nvim_command [[call CocActionAsync('doHover')]]
  end
end

local mappings = {
  ['n '] = { function() mines.wk.start(false) end, silent = true },
  ['v '] = { function() mines.wk.start(true) end, silent = true },

  -- PLUGINS --
  -- ======= --

  -- dsf.vim
  ['ndsf'] = { [[<plug>DsfDelete]] },
  ['ncsf'] = { [[<plug>DsfChange]] },

  -- easymotion
  ['nsf'] = { [[<plug>(easymotion-overwin-f)]] },
  ['nss'] = { [[<plug>(easymotion-s2)]] },
  ['nsh'] = { [[<plug>(easymotion-linebackward)]] },
  ['nsl'] = { [[<plug>(easymotion-lineforward)]] },
  ['ns/'] = { [[<plug>(easymotion-sn)]] },
  ['os/'] = { [[<plug>(easymotion-tn)]] },
  ['nsn'] = { [[<plug>(easymotion-next)]] },
  ['nsp'] = { [[<plug>(easymotion-prev)]] },

  -- vim-bookmarks
  ['nma'] = { [[<Cmd>FzfPreviewBookmarks<CR>]] },
  ['nmn'] = { [[<plug>BookmarkNext]] },
  ['nmp'] = { [[<plug>BookmarkPrev]] },
  ['nmm'] = { [[<plug>BookmarkToggle]] },
  ['nmi'] = { [[<plug>BookmarkAnnotate]] },
  ['nmc'] = { [[<plug>BookmarkClear]] },
  ['nmC'] = { [[<plug>BookmarkClearAll]] },

  -- vim-easy-align
  ['nga']	= { [[<plug>(EasyAlign)]], silent = true},
  ['xga']	= { [[<plug>(EasyAlign)]], silent = true},

  -- vim-edgemotion
  ['xgj']	= { [[<plug>(edgemotion-j)]]},
  ['xgk']	= { [[<plug>(edgemotion-k)]]},

  -- vim-highlightedundo
  ['n u']	    = {[[<plug>(highlightedundo-undo)]], noremap = false},
  ['n <c-r>']	= {[[<plug>(highlightedundo-redo)]], noremap = false},
  ['n U']	    = {[[<plug>(highlightedundo-Undo)]], noremap = false},
  ['n g-']	  = {[[<plug>(highlightedundo-gminus)]], noremap = false},
  ['n g+']	  = {[[<plug>(highlightedundo-gplus)]], noremap = false},

  -- vim-sandwich
  ['nsa']	 = { [[<plug>(operator-sandwich-add)]], silent = true},
  ['xsa']	 = { [[<plug>(operator-sandwich-add)]], silent = true},
  ['osa']	 = { [[<plug>(operator-sandwich-g@)]], silent = true},
  ['nsd']	 = { [[<plug>(operator-sandwich-delete)<plug>(operator-sandwich-release-count)<plug>(textobj-sandwich-query-a)]], silent = true},
  ['xsd']	 = { [[<plug>(operator-sandwich-delete)]], silent = true},
  ['nsr']  = { [[<plug>(operator-sandwich-replace)<plug>(operator-sandwich-release-count)<plug>(textobj-sandwich-query-a)]], silent = true},
  ['xsr']  = { [[<plug>(operator-sandwich-replace)]], silent = true},
  ['nsdb'] = { [[<plug>(operator-sandwich-delete)<plug>(operator-sandwich-release-count)<plug>(textobj-sandwich-auto-a)]], silent = true},
  ['nsrb'] = { [[<plug>(operator-sandwich-replace)<plug>(operator-sandwich-release-count)<plug>(textobj-sandwich-auto-a)]], silent = true},
  ['oib']  = { [[<plug>(textobj-sandwich-auto-i)]] },
  ['xib']  = { [[<plug>(textobj-sandwich-auto-i)]] },
  ['oab']  = { [[<plug>(textobj-sandwich-auto-a)]] },
  ['xab']  = { [[<plug>(textobj-sandwich-auto-a)]] },
  ['ois']  = { [[<plug>(textobj-sandwich-query-i)]] },
  ['xis']  = { [[<plug>(textobj-sandwich-query-i)]] },
  ['oas']  = { [[<plug>(textobj-sandwich-query-a)]] },
  ['xas']  = { [[<plug>(textobj-sandwich-query-a)]] },

  -- vimmagit
  ['nmg']	= { [[<cmd>Magit<CR>]] },

  -- splitjoin.vim
  ['nsj'] = { [[<cmd>SplitjoinJoin<CR>]] },
  ['nsk'] = { [[<cmd>SplitjoinSplit<CR>]] },

  -- vimwiki
  ['n W'] = { [[<cmd>VimwikiIndex<CR>]], description = 'VimWiki' },

  -- GENERAL --
  --=========--
  -- Remove spaces at the end of lines
  ['n,<space>']	= { [[<cmd>silent! keeppatterns %substitute/\s\+$//e<CR>]], silent = true},

  -- Start an external command with a single bang
  ['n!']	= { [[:!]]},

  -- mapping for decrease number
  ['n<C-x><C-x>']	= { [[<C-x>]]},

  -- in-menu scrolling
  ['i<c-j>'] = { [[pumvisible() ? "\<C-n>" : "\<C-j>"]], expr=true, noremap=false },
  ['i<c-k>'] = { [[pumvisible() ? "\<C-p>" : "\<C-k>"]], expr=true, noremap=false },
  ['i<c-e>'] = { [[pumvisible() ? "\<C-e>" : "\<End>"]], expr=true },

  -- scroll pages in menu
  ['i<c-f>'] = { [[pumvisible() ? "\<PageDown>" : "\<Right>"]], expr=true },
  ['i<c-b>'] = { [[pumvisible() ? "\<PageUp>" : "\<Left>"]], expr=true },
  ['i<c-d>'] = { [[pumvisible() ? "\<PageDown>" : "\<C-d>"]], expr=true, noremap=false },

  -- Select all
  ['ngv']	= { [[ggVG]], silent = true},

  -- yank to end
  ['nY']	= { [[y$]]},

  ['nzl']	= { [[z5l]]},
  ['nzh']	= { [[z5h]]},

  -- qq to record, Q to replay
  ['nQ']	= { [[@@]], noremap = true},

  -- make dot work in visual mode
  ['x.']	= { [[<cmd>norm.<CR>]], noremap = true},

  -- Quick substitute within selected area
  ['xs'] = {[[<cmd>s//gc<Left><Left><Left>]]},

  ['x@'] = { function()
    vim.api.nvim_command [[echo @.getcmdline()]]
    vim.api.nvim_command [[":'<,'>normal @".nr2char(getchar())]]
  end, noremap = true},

  -- sudo save
  ['cw!!'] = {[[execute 'silent! write !sudo tee % >/dev/null' <bar> edit!]]},

  -- Select last paste
  ['ngp']	= { [['`['.strpart(getregtype(), 0, 1).'`]']]},

  -- window control
  ['n<tab>']	= { [[<C-w>w]] },
  ['n<C-x>']	= { [[<C-w>x<C-w>w]] },
  ['n<C-w>z']	= { [[:vert resize<CR>:resize<CR>:normal! ze<CR>]] },

  -- allow misspellings
  ['cBd']	= { [[bd]]},
  ['cbD']	= { [[bd]]},
  ['cQ!']	= { [[q!]]},
  ['cQ1']	= { [[q!]]},
  ['cQa']	= { [[qa]]},
  ['cqw']	= { [[wq]]},
  ['cW!']	= { [[w!]]},
  ['cWq']	= { [[wq]]},
  ['cWa']	= { [[wa]]},
  ['cwQ']	= { [[wq]]},
  ['cWQ']	= { [[wq]]},
  ['cW']	= { [[w]]},
  ['cQall'] = { [[qall]]},
  ['cQall!'] = { [[qall!]]},

  -- faster saving
  ['n<c-s>'] = { [[<cmd>write<CR>]], silent = true },
  ['v<c-s>'] = { [[<cmd>write<CR>]], silent = true },
  ['c<c-s>'] = { [[<cmd>write<CR>]], silent = true },
  ['i<c-s>'] = { [[<esc><cmd>write<CR>]], silent = true },

  --window management
  ['nsv'] = { [[<cmd>split<CR>]], silent = true },
  ['nsg'] = { [[<cmd>vsplit<CR>]], silent = true },
  ['nst'] = { [[<cmd>tabnew<CR>]], silent = true },
  ['nso'] = { [[<cmd>only<CR>]], silent = true },
  ['nsb'] = { [[<cmd>b#<CR>]], silent = true },
  ['nsc'] = { [[<cmd>close<CR>]], silent = true },
  ['nsx'] = { [[<cmd>bdelete<CR>]], silent = true },

  -- tabs
  ['nth'] = { [[<cmd>tabfirst<CR>]] },
  ['ntk'] = { [[<cmd>tabnext<CR>]] },
  ['ntj'] = { [[<cmd>tabprevious<CR>]] },
  ['ntl'] = { [[<cmd>tablast<CR>]] },
  ['ntc'] = { [[<cmd>tabclose<CR>]] },
  ['ntn'] = { [[<cmd>tabnew<CR>]] },

  -- insert keymap like emacs
  ['i<c-w>'] = { [[<C-[>diwa]] },
  ['i<c-h>'] = { [[<BS>]] },
  ['i<c-u>'] = { [[<C-G>u<C-U>]] },
  ['i<c-a>'] = { [[<Home>]] },

  -- command line alias
  ['c<c-p>'] = { [[<Up>]] },
  ['c<c-b>'] = { [[<Left>]] },
  ['c<c-f>'] = { [[<Right>]] },
  ['c<c-a>'] = { [[<Home>]] },
  ['c<c-e>'] = { [[<End>]] },
  ['c<c-d>'] = { [[<Del>]] },
  ['c<c-h>'] = { [[<BS>]] },
  ['c<c-t>'] = { [[<C-R>=expand("%:p:h") . "/" <CR>]] },

  -- go to begining or End of line
  ['nB'] = { [[^]], silent=true },
  ['nE'] = { [[$]], silent=true },
  ['xB'] = { [[^]], silent=true },
  ['xE'] = { [[$]], silent=true },

  -- window resizing
  ['n<S-UP>'] = { [[<C-W>+]] },
  ['n<S-DOWN>'] = { [[<C-W>-]] },
  ['n<S-LEFT>'] = { [[<C-W><]] },
  ['n<S-RIGHT>'] = { [[<C-W>>]] },

  -- indenting
  ['n>'] = { [[>>_]] },
  ['n<'] = { [[<<_]] },
  ['x>'] = { [[>gv|]] },
  ['x<'] = { [[<gv]] },

  ['i<C-Space>'] = { [[coc#refresh()]], silent = true, expr = true },

  ['n<CR>']  = { [[za]], description = 'Toggle Fold' },
  ['n<BS>']  = { [[%]], description = 'Matchit' },
  ['x<BS>']  = { [[%]], description = 'Matchit X' },

  ['ijk'] = { [[<esc>]], description = 'Exit insert mode' },
  ['nU'] = { [[<C-r>]], description = 'Redo' },
  ['nK'] = { function() show_documentation() end, description = 'Show documentation', silent = true },
  ['ngh'] = { function() show_documentation() end, description = 'Show documentation', silent = true },

  -- Completion for all lines in all buffers
  ['i<C-x><C-l>'] = { [[<Plug>(fzf-complete-line)]] },
  ['i<C-x><C-e>'] = { [[<Plug>(fzf-complete-path)]] },
  ['i<C-x><C-w>'] = { [[<Plug>(fzf-complete-word)]] },
  ['i<C-x><C-u>'] = { function() mines.files.insert_relative_path(vim.fn.expand('%:p:h')) end },

  ['n ,'] = { [[<Cmd>FzfPreviewBuffers<CR>]], description = 'Switch buffer' },
  ['n .'] = { [[<Cmd>FzfPreviewProjectFiles<CR>]], description = 'Find files' },
  ['n  '] = { [[<Cmd>Commands<CR>^]] },
  ["n '"] = { [[q:]], description = 'Ex History' },
  ["v '"] = { [[q:]], description = 'Ex History' },
  ['n x'] = { [[<Cmd>sp e<CR>]], description = 'Scratch buffer' },

  -- REPL mappings <leader>r
  ['n rr']      = { [[<cmd>IronRepl<CR><ESC>]], silent = true },
  ['n rq']      = { [[<plug>(iron-exit)<CR>]], silent = true },
  ['n rl']      = { [[<plug>(iron-send-line)]], silent = true },
  ['v rl']      = { [[<plug>(iron-visual-send)]], silent = true },
  ['n rp']      = { [[<plug>(iron-repeat-cmd)]], silent = true },
  ['n rc']      = { [[<plug>(iron-clear)]], silent = true },
  ['n r<CR>']	  = { [[<plug>(iron-cr)]], silent = true },
  ['n r<ESC>']	= { [[<plug>(iron-interrupt)]], silent = true },

  -- File mappings <leader>f
  ['n fs'] = { [[<Cmd>CocList sessions<CR>]], description = 'Save file' },
  ['n fS'] = { [[<Cmd>wa<CR>]], description = 'Save all files' },
  ['n f/'] = { [[<Cmd>FzfPreviewBufferLines<CR>]], description = 'Search lines' },
  ['n ff'] = { [[<Plug>(Prettier)]], description = 'Format file' },
  ['n fo'] = { [[<Cmd>Dirvish %:p:h<CR>]], description = 'Show in tree' },
  ['n fO'] = { [[<Cmd>vsp +Dirvish %:p:h<CR>]], description = 'Show in split tree' },
  ['n fr'] = { [[<Cmd>History<CR>]], description = 'Open recent files' },
  ['n fu'] = { [[<Cmd>UndotreeToggle<CR>]], description = 'Undo tree' },
  ['n fU'] = { [[<Cmd>UndotreeFocus<CR>]], description = 'Focus undo tree' },
  ['n fE'] = { [[<Cmd>vsp $MYVIMRC<CR>]], description = 'Edit .vimrc' },
  ['n fF'] = { [[<Cmd>FzfPreviewProjectFiles %:p:h<CR>]], description = 'Find from file' },
  ['n fP'] = { [[<Cmd>FzfPreviewProjectFiles ~/.config/nvim/lua<CR>]], description = 'Find config file' },
  ['n fx'] = { [[<Cmd>CocFzfList diagnostics --current-buf<CR>]], description = 'Document diagnostics' },

  -- Buffer mappings <leader>b
  ['n bp'] = { [[<Cmd>bprevious<CR>]], description = 'Previous buffer' },
  ['n bn'] = { [[<Cmd>bnext<CR>]], description = 'Next buffer' },
  ['n bf'] = { [[<Cmd>bfirst<CR>]], description = 'First buffer' },
  ['n bl'] = { [[<Cmd>blast<CR>]], description = 'Last buffer' },
  ['n bd'] = { [[<Cmd>bp<CR>:bd#<CR>]], description = 'Delete buffer' },
  ['n bk'] = { [[<Cmd>bp<CR>:bw!#<CR>]], description = 'Wipe buffer' },
  ['n bK'] = { function() mines.buf.delete_buffers_fzf() end, description = 'Wipe buffers' },
  ['n bb'] = { [[<Cmd>FzfPreviewBuffers<CR>]], description = 'List buffers' },
  ['n bY'] = { [[ggyG]], description = 'Yank buffer' },
  ['n bm'] = { [[:<C-u>cgetexpr bm#location_list()<CR> :<C-u>Quickfix<CR>]], description = 'Bookmark List' },
  ['n bt'] = { [[<plug>BookmarkToggle]], description = 'Set mark' },

  -- Window mappings <leader>w
  ['n ww'] = { [[<C-W>w]], description = 'Move below/right' },
  ['n wa'] = { [[<Cmd>Windows<CR>]], description = 'List windows' },
  ['n wd'] = { [[<C-W>c]], description = 'Delete window' },
  ['n wv'] = { [[<C-W>s]], description = 'Split window' },
  ['n wg'] = { [[<C-W>v]], description = 'Split window vertical' },
  ['n wn'] = { [[<C-W>n]], description = 'New window' },
  ['n wq'] = { [[<C-W>q]], description = 'Quit window' },
  ['n wj'] = { [[<C-W>j]], description = 'Move down' },
  ['n wk'] = { [[<C-W>k]], description = 'Move up' },
  ['n wh'] = { [[<C-W>h]], description = 'Move left' },
  ['n wl'] = { [[<C-W>l]], description = 'Move right' },
  ['n wJ'] = { [[<C-W>J]], description = 'Move window down' },
  ['n wK'] = { [[<C-W>K]], description = 'Move window up' },
  ['n wH'] = { [[<C-W>H]], description = 'Move window left' },
  ['n wL'] = { [[<C-W>L]], description = 'Move window right' },
  ['n wr'] = { [[<C-W>r]], description = 'Rotate forward' },
  ['n wR'] = { [[<C-W>R]], description = 'Rotate backwards' },
  ['n wbj'] = { [[<Cmd>resize -5<CR>]], description = 'Shrink' },
  ['n wbk'] = { [[<Cmd>resize +5<CR>]], description = 'Grow' },
  ['n wbl'] = { [[<Cmd>vertical resize +5<CR>]], description = 'Vertical grow' },
  ['n wbh'] = { [[<Cmd>vertical resize -5<CR>]], description = 'Vertical shrink' },
  ['n wbJ'] = { [[<Cmd>resize -20<CR>]], description = 'Shrink large' },
  ['n wbK'] = { [[<Cmd>resize +20<CR>]], description = 'Grow large' },
  ['n wbL'] = { [[<Cmd>vertical resize +20<CR>]], description = 'Vertical grow large' },
  ['n wbH'] = { [[<Cmd>vertical resize -20<CR>]], description = 'Vertical shrink large' },
  ['n wb='] = { [[<C-W>=]], description = 'Balance splits' },
  ['n w='] = { [[<C-W>=]], description = 'Balance splits' },
  ['n wF'] = { [[<Cmd>tabnew<CR>]], description = 'New tab' },
  ['n wo'] = { [[<Cmd>tabnext<CR>]], description = 'Next tab' },
  ['n w/'] = { [[<Cmd>Windows<CR>]], description = 'Search windows' },
  ['n wS'] = { [[<Cmd>Startify<CR>]], description = 'Start screen' },

  -- Project mappings <leader>p
  ['n ph'] = { [[<Cmd>History<CR>]], description = 'MRU' },
  ['n pf'] = { [[<Cmd>FzfPreviewProjectFiles<CR>]], description = 'Find file' },
  ['n pF'] = { [[<Cmd>Files! .<CR>]], description = 'Find file fullscreen' },
  ['n pT'] = { [[<Cmd>vsp +Dirvish<CR>]], description = 'Open File explorer in split' },
  ['n pt'] = { [[<Cmd>Dirvish<CR>]], description = 'Open file Explorer' },
  ['n pq'] = { [[<Cmd>qall<CR>]], description = 'Quit project' },
  ['n pc'] = { function() mines.project.cd_to_root() end, description = 'Cwd to root' },
  ['n ps'] = { function()
    local word = vim.fn.expand("<cword>")

    vim.api.nvim_command('Files .')
    vim.api.nvim_input(word)
  end, description = 'Find file with text' },

  -- Workspace mappings <leader>q
  ['n q'] = { [[<Cmd>q<CR>]], description = 'Quit' },
  ['n Q'] = { [[<Cmd>q!<CR>]], description = 'Force quit' },

  -- Navigation mappings <leader>j
  ['n jl'] = { [[$]], description = 'End of line' },
  ['v jl'] = { [[$]], description = 'End of line', which_key = false },
  ['n jh'] = { [[0]], description = 'Start of line' },
  ['v jh'] = { [[0]], description = 'Start of line', which_key = false },
  ['n jk'] = { [[<C-b>]], description = 'Page up' },
  ['v jk'] = { [[<C-b>]], description = 'Page up', which_key = false },
  ['n jj'] = { [[<C-f>]], description = 'Page down' },
  ['v jj'] = { [[<C-f>]], description = 'Page down', which_key = false },
  ['n jd'] = { [[<plug>(coc-definition)]], description = 'Definition' },
  ['n ji'] = { [[<plug>(coc-implementation)]], description = 'Implementation' },
  ['n jy'] = { [[<plug>(coc-type-definition)]], description = 'Type definition' },
  ['n jr'] = { [[<plug>(coc-references)]], description = 'Type references' },
  ['n jep'] = { [[<plug>(coc-diagnostic-prev)]], description = 'Previous error' },
  ['n jen'] = { [[<plug>(coc-diagnostic-next)]], description = 'Next error' },
  ['n jqp'] = { [[<Cmd>cN<CR>]], description = 'Previous' },
  ['n jqn'] = { [[<Cmd>cn<CR>]], description = 'Next' },
  ['n jn'] = { [[<C-o>]], description = 'Next jump' },
  ['n jp'] = { [[<C-i>]], description = 'Previous jump' },
  ['n jml'] = { [[<Cmd>Marks<CR>]], description = 'List marks' },
  ['n jmd'] = { [[:delmarks<Space>]], description = 'Delete marks' },
  ['n jmm'] = { [[`]], description = 'Go to mark' },
  ['n ja'] = { [[<Cmd>A<CR>]], description = 'Go to altenate' },
  ['n jA'] = { [[<Cmd>AV<CR>]], description = 'Split altenate' },
  ['n jcn'] = { [[g,]], description = 'Next change' },
  ['n jcp'] = { [[g;]], description = 'Previous change' },

  -- Insert mappings <leader>i
  ['n if'] = { [["%p]], description = 'Current file name' },
  ['n iF'] = { [[<Cmd>put = expand('%:p')<CR>]], description = 'Current file path' },

  -- Search mappings <leader>s
  ['n sd'] = { [[<Cmd>FlyDRg<CR>]], description = 'Grep files in directory' },
  ['n sc'] = { [[<Cmd>History:<CR>]], description = 'Search command history' },
  ['n sh'] = { [[<Cmd>History/<CR>]], description = 'Search history' },
  ['n si'] = { [[<Cmd>CocFzfList symbols<CR>]], description = 'Search symbol' },
  ['n sb'] = { [[<Cmd>FzfPreviewBufferLines<CR>]], description = 'Search buffer' },
  ['n ss'] = { [[<Cmd>FzfPreviewBufferLines<CR>]], description = 'Search buffer' },
  ['n so'] = { [[<Cmd>CocFzfList symbols<CR>]], description = 'List symbols in file' },
  ['n sl'] = { [[<Cmd>FzfPreviewLines<CR>]], description = 'Search lines' },
  ['n sp'] = { [[<Cmd>FlyRg<CR>]], description = 'Grep files in project' },
  ['n sP'] = { [[<Cmd>FlyRg!<CR>]], description = 'Grep files in project (full),' },
  ['n sm'] = { [[<Cmd>Marks<CR>]], description = 'Jump to marks' },
  ['n sS'] = { [[:Rg <C-r><C-w><CR>]], description = 'Search selected text (project)' },
  ['n sa'] = { function()
    mines.grep.flygrep('', vim.fn.expand('%:p:h'), 0, { '--hidden', '--no-ignore' })
  end, description = 'Grep all files' },

  -- Local Search/Replace mappings <leader>/
  ['n /h'] = { [[<Cmd>noh<CR>]], description = 'Clear searh highlight' },
  ['n /s'] = { [[g*N]], description = 'Search selected text' },
  ['v /s'] = { [["9y/<C-r>9<CR>]] },
  ['v /S'] = { [["9y:Rg <C-r>9<CR>]] },
  ['n /r'] = { function()
    vim.api.nvim_command('normal g*')
    vim.api.nvim_input(':%s//')
  end, description = 'Replace selected text' },

  -- Yank with preview <leader>y
  ['n yf'] = { [[<cmd>let @+=expand("%:~:.")<CR>:echo 'Yanked relative path'<CR>]], description = 'Yank file path relative' },
  ['n yF'] = { [[<cmd>let @+=expand("%:p")<CR>:echo 'Yanked absolute path'<CR>]], description = 'Yank file path absolute' },
  ['n yn'] = { [[<cmd>let @+=expand("%:t:r")<CR>:echo 'Yanked file name'<CR>]], description = 'Yank file name' },
  ['n yy'] = { [["+y]], description = 'Yank to clipboard' },
  ['v yy'] = { [["+y]] },

  -- Code mappings <leader>c
  ['n cl'] = { [[<Cmd>Commentary<CR>]], description = 'Comment line' },
  ['v cl'] = { [[:Commentary<CR>]] },
  ['n cx'] = { [[<cmd>CocList diagnostics --current-buf<CR>]], description = 'Document diagnostics' },
  ['n cX'] = { [[<cmd>CocList diagnostics<CR>]], description = 'Workspace diagnostics' },
  ['n cd'] = { [[<plug>(coc-definition)]], description = 'Definition' },
  ['n cD'] = { [[<plug](coc-references)]], description = 'Type references' },
  ['n ck'] = { [[gh]], description = 'Jump to documentation', noremap = false },
  ['n cr'] = { [[<plug>(coc-rename)]], description = 'LSP rename' },
  ['n cR'] = { function()
    vim.api.nvim_command("CocRestart")
    vim.api.nvim_command("e!")
  end, description = 'LSP reload' },
  ['n cs'] = { [[<cmd>call CocActionAsync('showSignatureHelp')<cr>]], description = 'Signature help' },
  ['n ca'] = { [[<cmd>CocList actions<CR> ]], description = 'LSP code actions' },

  -- Git mappings <leader>g
  ['n gcu'] = { [[<Cmd>GitGutterUndoHunk<CR>]], description = 'Undo chunk' },
  ['n gcs'] = { [[<Cmd>GitGutterStageHunk<CR>]], description = 'Stage chunk' },
  ['n gcn'] = { [[<Cmd>GitGutterNextHunk<CR>]], description = 'Next chunk' },
  ['n gcp'] = { [[<Cmd>GitGutterPrevHunk<CR>]], description = 'Previous chunk' },
  ['n gci'] = { [[<Cmd>GitGutterPreviewHunk<CR>]], description = 'Chunk info' },
  ['n gB'] = { function() mines.git.checkout_git_branch_fzf(vim.fn.expand("%:p:h")) end , description = 'Checkout branch' },
  ['n gs'] = { [[<Cmd>G<CR>]], description = 'Git status' },
  ['n gd'] = { [[<Cmd>Gdiffsplit<CR>]], description = 'Git diff' },
  ['n ge'] = { [[<Cmd>Gedit<CR>]], description = 'Git edit' },
  ['n gg'] = { function() mines.term.float_cmd('lazygit') end, description = 'Git GUI' },
  ['n gl'] = { [[<Cmd>Commits<CR>]], description = 'Git log' },
  ['n gL'] = { [[<Cmd>BCommits<CR>]], description = 'Git file log' },
  ['n gF'] = { [[<Cmd>Gfetch<CR>]], description = 'Git fetch' },
  ['n gp'] = { [[<Cmd>Gpull<CR>]], description = 'Git pull' },
  ['n gP'] = { [[<Cmd>Gpush<CR>]], description = 'Git push' },
  ['n gb'] = { [[<Cmd>Gblame<CR>]], description = 'Git blame' },
  ['n gfc'] = { function() unimplemented() end, description = 'Find commit' },
  ['n gff'] = { function() unimplemented() end, description = 'Find file' },
  ['n gfg'] = { function() unimplemented() end, description = 'Find gitconfig file' },
  ['n gfi'] = { function() unimplemented() end, description = 'Find issue' },
  ['n gfp'] = { function() unimplemented() end, description = 'Find pull request' },

  -- Terminal mappings <leader>wt
  ['n wtt'] = { function() mines.term.float(true) end, description = 'Float terminal' },
  ['n wtv'] = { function()
    vim.api.nvim_command("sp")
    mines.term.open_term()
  end, description = 'Vertical split terminal' },
  ['n wtg'] = { function()
    vim.api.nvim_command('vsp')
    mines.term.open_term(true)
  end, description = 'Terminal at file' },

  -- Toggle mappings <leader>t
  ['n tl'] = { function()
    if vim.wo.number == false then
      vim.wo.number=true
      vim.wo.relativenumber=true
    else
      vim.wo.number=false
      vim.wo.relativenumber=false
    end
  end, description = 'Line numbers' },
  ['n tw'] = { [[<cmd>set wrap!<CR>]], description = 'Word wrap' },
  ['n tb'] = { function()
    if not vim.fn.exists(vim.g.colors_name) then
      vim.api.nvim_command("echomsg 'No colorscheme set'")
      return
    end

    local scheme = vim.g.colors_name

    if scheme == 'typewriter' or scheme == 'typewriter-night' then
      if vim.o.background == 'dark' then
        vim.api.nvim_command [[execute 'colorscheme typewriter']]
      else
        vim.api.nvim_command [[execute 'colorscheme typewriter-night']]
      end
    elseif scheme == 'seoul265' or scheme == 'seoul265-light' then
      if vim.o.background == 'dark' then
        vim.api.nvim_command [[execute 'colorscheme seoul265-light']]
      else
        vim.api.nvim_command [[execute 'colorscheme seoul256-light']]
      end
    elseif scheme == 'OceanicNext' or scheme == 'OceanicNextLight' then
      if vim.o.background == 'dark' then
        vim.api.nvim_command [[execute 'colorscheme OceanicNextLight']]
      else
        vim.api.nvim_command [[execute 'colorscheme OceanicNext']]
      end
    elseif scheme == 'ayu' then
      if vim.o.background == 'dark' then
        vim.g.ayucolor = 'light'
        vim.api.nvim_command [[execute 'colorscheme ayu']]
      else
        vim.g.ayucolor = 'dark'
        vim.api.nvim_command [[execute 'colorscheme ayu']]
      end
    else
      vim.api.nvim_command [[execute 'set background='.(&background ==# 'dark' ? 'light' : 'dark')]]
      if not vim.fn.exists(vim.g.colors_name) then
        vim.api.nvim_command(("execute 'colorscheme' %s"):format(scheme))
        vim.api.nvim_command(("echomsg 'The colorscheme `'.%s .'` doesn''t have background variants!'"):format(scheme))
      else
        vim.api.nvim_command [[echo 'Set colorscheme to '.&background.' mode']]
      end
    end
  end, description = 'background' },

  ['n ti'] = { [[<cmd>IndentLinesToggle<CR>]], description = 'IndentLines' },
  ['n tr'] = { [[<cmd>RainbowToggle<CR>]], description = 'Rainbow' },
  ['n ts'] = { [[<cmd>set spell!<CR>]], description = 'Spell check' },
  ['n tg'] = { [[<cmd>Goyo<CR>]], description = 'Goyo' },

  -- Help mappings <leader>h
  ['n hh'] = { [[<cmd>Helptags<CR>]], description = 'Help tags' },
  ['n hs'] = { [[:UltisnipsEdit<CR>]], description = 'Edit snippets' },

  -- localleader mappings (;)
  ['n;f'] = { [[<cmd>Files<cr>]], silent = true },
  ['n;g'] = { function()
    mines.grep.flygrep('', vim.fn.expand('%:p:h'), 0, { '--hidden', '--no-ignore' })
  end, description = 'Grep all files', silent = true },
  ['n;b'] = { [[<cmd>FzfPreviewBuffers<cr>]], silent = true},
  ['n;d'] = { [[<cmd>CocFzfList diagnostics --current-buf<cr>]], silent = true },
  ['n;c'] = { [[<cmd>Colors<cr>]], silent = true},
  ['n;C'] = { [[<cmd>Files ~/.config/nvim<cr>]], silent = true },
  ['n;s'] = { [[<cmd>CocList sessions<cr>]], silent = true},
  ['n;v'] = { [[<cmd>CocFzfList yank<cr>]], silent = true },
  ['n;q'] = { [[<cmd>FzfPreviewQuickFix<cr>]], silent = true },
  ['n;h'] = { [[<cmd>Helptags<cr>]], silent = true },
  ['n;/'] = { [[<cmd>FzfPreviewLines<cr>]], silent = true },
  ['n;<tab>'] = { [[<cmd>Maps<cr>]], silent = true },
  ['n;tv'] = { function() mines.term.float_cmd('vtop') end },
  ['n;tm'] = { function() mines.term.float_cmd('ncmpcpp') end },
  ['n;tc'] = { function() mines.term.float_cmd('cmus') end },
  ['n;tg'] = { function() mines.term.float_cmd('lazygit') end },
}

local which_key_map = {
  [' '] = 'Ex command',
  ['/'] = { name = '+local-search' },
  s = { name = '+search' },
  f = { name = '+file' },
  b = { name = '+buffers' },
  w = { name = '+windows', b = { name = '+balance' }, t = { name = '+terminal' } },
  y = { name = '+yank' },
  i = { name = '+insert' },
  g = { name = '+git', c = { name = '+chunk' }, f = { name = '+find' } },
  p = { name = '+project' },
  h = { name = '+help' },
  c = {
    name = '+code',
    s = { name = '+snippets' },
    c = {
      name = '+case',
      p = 'PascalCase',
      m = 'MixedCase',
      c = 'camelCase',
      u = 'UPPER CASE',
      U = 'UPPER CASE',
      t = 'Title Case',
      s = 'Sentence case',
      ['_'] = 'snake_case',
      k = 'kebab-case',
      ['-'] = 'dash-case',
      [' '] = 'space case',
      ['.'] = 'dot.case'
    }
  },
  -- Locals need to be defined per filetype
  m = { name = '+local' },
  d = { name = '+documentation' },
  j = {
    name = '+jump',
    m = { name = '+marks' },
    c = { name = '+changes' },
    e = { name = '+errors' },
    q = { name = '+quickfix' }
  },
  t = { name = '+toggle' }
}

mines.mappings.register_mappings(mappings, { noremap = true }, which_key_map)
vim.g.which_key_map = which_key_map

vim.api.nvim_command [[omap i/ <Plug>(textobj-between-i)/]]
vim.api.nvim_command [[omap a/ <Plug>(textobj-between-a)/]]
vim.api.nvim_command [[xmap i/ <Plug>(textobj-between-i)/]]
vim.api.nvim_command [[xmap a/ <Plug>(textobj-between-a)/]]
vim.api.nvim_command [[omap i_ <Plug>(textobj-between-i)_]]
vim.api.nvim_command [[omap a_ <Plug>(textobj-between-a)_]]
vim.api.nvim_command [[xmap i_ <Plug>(textobj-between-i)_]]
vim.api.nvim_command [[xmap a_ <Plug>(textobj-between-a)_]]
vim.api.nvim_command [[omap i- <Plug>(textobj-between-i)-]]
vim.api.nvim_command [[omap a- <Plug>(textobj-between-a)-]]
vim.api.nvim_command [[xmap i- <Plug>(textobj-between-i)-]]
vim.api.nvim_command [[xmap a- <Plug>(textobj-between-a)-]]
vim.api.nvim_command [[omap i<Space> <Plug>(textobj-between-i)<Space>]]
vim.api.nvim_command [[omap a<Space> <Plug>(textobj-between-a)<Space>]]
vim.api.nvim_command [[xmap i<Space> <Plug>(textobj-between-i)<Space>]]
vim.api.nvim_command [[xmap a<Space> <Plug>(textobj-between-a)<Space>]]

-- vim-asterisk / vim-anzu
vim.api.nvim_command [[map n <plug>(is-nohl)<plug>(anzu-n)]]
vim.api.nvim_command [[map N <plug>(is-nohl)<plug>(anzu-N)]]
vim.api.nvim_command [[map * <plug>(asterisk-g*)<plug>(is-nohl-1)]]
vim.api.nvim_command [[map # <plug>(asterisk-g#)<plug>(is-nohl-1)]]

-- I can't get the following mappings to work in lua...
vim.api.nvim_command [[
function! s:check_back_space() abort
    let l:col = col('.') - 1
    return !l:col || getline('.')[l:col - 1]  =~# '\s'
endfunction
]]

-- Use tab for trigger completion with characters ahead and navigate.
-- Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
vim.api.nvim_command [[inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : coc#expandableOrJumpable() ? coc#rpc#request('doKeymap', ['snippets-expand-jump','']) : <SID>check_back_space() ? "\<TAB>" :  coc#refresh()]]
vim.api.nvim_command [[inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"]]

if vim.fn.exists('*complete_info') then
  vim.api.nvim_command [[inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"]]
else
  vim.api.nvim_command [[inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"]]
end

-- coc.nvim
-- Define mapping for diff mode to avoid recursive mapping
-- use `[g` and `]g` to navigate diagnostics
vim.api.nvim_command [[nnoremap <silent> <plug>(diff-prev) [g]]
vim.api.nvim_command [[nnoremap <silent> <plug>(diff-next) ]g]]
vim.api.nvim_command [[nmap <silent><expr> [g &diff ? "\<plug>(diff-prev)" : "\<plug>(coc-diagnostic-prev)"]]
vim.api.nvim_command [[nmap <silent><expr> ]g &diff ? "\<plug>(diff-next)" : "\<plug>(coc-diagnostic-next)"]]

vim.api.nvim_command [[nmap <silent><expr> ;k &diff ? "\<plug>(diff-prev)" : "\<plug>(coc-diagnostic-prev)"]]
vim.api.nvim_command [[nmap <silent><expr> ;j &diff ? "\<plug>(diff-next)" : "\<plug>(coc-diagnostic-next)"]]
