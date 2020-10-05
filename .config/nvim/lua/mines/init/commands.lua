local vim =  vim

vim.api.nvim_command  [[autocmd CursorHold * silent call CocActionAsync('highlight')]]

mines.mappings.create_augroups {
  terminal = {{ 'TermOpen', '*', function() vim.api.nvim_command [[set nospell nonumber]] end }};

  startify = {{ 'User', 'Starfified', function() vim.bo.buflisted = true end }};

  edit = {{ 'BufWrite', '*', 'silent!', function() mines.buf.trim_trailing_whitespace() end }};

  folds = {{ 'Syntax', '*', 'silent! normal! zR' }};

  gitlens_show = {{ 'CursorHold', '*',  function() mines.gitlens.show() end }};
  gitlens_clear = {{ 'CursorMoved,CursorMovedI', '*',  function() mines.gitlens.clear() end }};

  -- Do not use smart case in command line mode,
  -- From: https://goo.gl/vCTYdK
  cmdline_enter = {{ 'CmdLineEnter', '', function() vim.api.nvim_command [[set nosmartcase]] end }};
  cmdline_leave = {{ 'CmdLineLeave', '', function() vim.api.nvim_command [[set smartcase]] end }};

  -- make splits equal in size
  equal_splits = {{ 'VimResized', '*', function() vim.api.nvim_command [[wincmd =]] end }};

  -- force write shada on leaving nvim
  force_write_shada = {{ 'VimLeave', '*', function() vim.api.nvim_command [[if has('nvim') | wshada! | else | wviminfo! | endif]] end }};

  -- when editing a file, always jump to the last known cursor position.
  -- don't do it when the position is invalid or when inside an event handler
  last_position = {{ 'BufReadPost', '*', function()
    vim.api.nvim_command [[
      if &ft !~# 'commit' && ! &diff && line("'\"") >= 1 && line("'\"") <= line("$") | execute 'normal! g`"zvzz' | endif
    ]]
  end }};

  -- update filetype on save if empty
  update_ft_if_empty = {{ 'BufReadPost', '*' , 'nested', function()
    vim.api.nvim_command [[ if &l:filetype ==# '' || exists('b:ftdetect') | unlet! b:ftdetect | filetype detect | endif ]]
  end }};

  -- vim-dadbod
  dadbod = {{ 'BufReadPost', '*.dbout', function() vim.api.nvim_command [[ setlocal nofoldenable ]] end }};

  -- highlight the current line in the current window.
  hl_buf_enter = {{ [[BufEnter]], '*', function() vim.api.nvim_command [[set cursorline]] end }};
  hl_buf_leave = {{ [[BufLeave]], '*', function() vim.api.nvim_command [[set cursorline]] end }};
  hl_insert_enter = {{ [[InsertEnter]], '*', function() vim.api.nvim_command [[set nocursorline]] end }};
  hl_insert_leave = {{ [[InsertLeave]], '*', function() vim.api.nvim_command [[set cursorline]] end }};

  -- See: https://github.com/neovim/neovim/issues/7994
  no_paste = {{ 'InsertLeave', '*', function() vim.api.nvim_command [[set nopaste]] end }};
  sync_minlines = {{ 'Syntax', '*', function() vim.api.nvim_command [[if line('$') > 5000 | syntax sync minlines=200 | endif]] end }};
  quit_on_q = {{ 'FileType', '*', function()
    local quit_on_q = {
      preview ='preview',
      qf ='qf',
      netrw ='netrw',
      help ='help',
      taskedit ='taskedit',
      diff ='diff',
      startuptime ='startuptime',
    };

    if vim.wo.diff or quit_on_q[vim.bo.filetype] then
      vim.api.nvim_command [[nmap <buffer><silent><expr>q &diff ? '<cmd>qa!<cr>' : '<cmd>q<cr>']]
    end
  end }};

  -- coc.nvim commands
  coc_ft_py = {{ 'FileType', 'python,rust', function() vim.api.nvim_command("let b:coc_root_patterns = ['pyproject.toml', '.git', '.env']") end }};
  coc_format = {{ 'FileType', 'typescript,json', function() vim.api.nvim_command [[setl formatexpr=CocActionAsync('formatSelected')]] end }};
  coc_signature_help = {{ 'User', 'CocJumpPlaceholder', function() vim.api.nvim_command [[call CocActionAsync('showSignatureHelp')]] end }};

  -- Filetypes
  yarn_lock      = {{ 'BufNewFile,BufRead', 'yarn.lock', function() vim.api.nvim_command [[:setfiletype yaml]] end }};
  kube           = {{ 'BufNewFile,BufRead', '*/.kube/config', function() vim.api.nvim_command [[:setfiletype json]] end }};
  postman        = {{ 'BufNewFile,BufRead', '*.postman_collection', function() vim.api.nvim_command [[:setfiletype json]] end }};
  js_map         = {{ 'BufNewFile,BufRead', '*.js.map', function()  vim.api.nvim_command [[:setfiletype json]] end }};
  jsbeautifyrc   = {{ 'BufNewFile,BufRead', '.jsbeautifyrc', function() vim.api.nvim_command [[setfiletype json]] end }};
  eslintrc       = {{ 'BufNewFile,BufRead', '.eslintrc', function() vim.api.nvim_command [[:setfiletype json]] end }};
  jscsrc         = {{ 'BufNewFile,BufRead', '.jscsrc', function() vim.api.nvim_command [[:setfiletype json]] end }};
  babelrc        = {{ 'BufNewFile,BufRead', '.babelrc', function() vim.api.nvim_command [[:setfiletype json]] end }};
  watchmanconfig = {{ 'BufNewFile,BufRead', '.watchmanconfig', function() vim.api.nvim_command [[:setfiletype json]] end }};
  flowconfig     = {{ 'BufNewFile,BufRead', '.flowconfig', function() vim.api.nvim_command [[:setfiletype ini]] end }};
  tmux           = {{ 'BufNewFile,BufRead', 'Tmuxfile,tmux/config', function()
    vim.api.nvim_command [[:setfiletype tmux]]
    vim.api.nvim_command [[set ts=2 sts=2 sw=2]]
  end }};

  -- custom commands
  bmdirs = {{ 'BufWritePost', '~/.config/bmdirs,~/config/bmfiles', function() vim.api.nvim_command [[:!shortcuts]] end }};
  xresources = {{ 'BufWritePost', '*Xresources,*Xdefaults', function() vim.api.nvim_command [[:!xrdb %]] end }};
  bspwm = {{ 'BufWritePost', 'bspwmrc', function() vim.api.nvim_command [[:!bspc wm -r]] end }};
  sxhkd= {{ 'BufWritePost', 'sxhkdrc', function() vim.api.nvim_command [[:!bspc wm -r]] end }};
  picom = {{ 'BufWritePost', 'picom.conf', function() vim.api.nvim_command [[:!bspc wm -r]] end }};
  polybar = {{ 'BufWritePost', '*polybar/config', function() vim.api.nvim_command [[:!bspc wm -r]] end }};
  ncmpcpp = {{ 'BufWritePost', '*ncmpcpp/config, *ncmpcpp/bindings', function() vim.api.nvim_command [[:!killall ncmpcpp; $TERMINAL -e  ncmpcpp &]] end }};
  transmission = {{ 'BufWritePost', '*transmission-daemon/settings.json', function() vim.api.nvim_command [[:!kill -HUP transmission-da]] end }};
}

mines.command [[command! -bang -nargs=* DRg call luaeval('mines.grep.grep(unpack(_A))', [<q-args>, expand('%:p:h'), <bang>0])]]
mines.command [[command! -bang -nargs=* Rg call luaeval('mines.grep.grep(unpack(_A))', [<q-args>, getcwd(), <bang>0])]]
mines.command [[command! -bang -nargs=* FlyDRg call luaeval('mines.grep.flygrep(unpack(_A))', [<q-args>, expand('%:p:h'), <bang>0])]]
mines.command [[command! -bang -nargs=* FlyRg call luaeval('mines.grep.flygrep(unpack(_A))', [<q-args>, getcwd(), <bang>0])]]
mines.command [[command! -bang -nargs=? -complete=dir Files
  call luaeval('mines.files.fzf_files(unpack(_A))', [<q-args>, <bang>0])
]]
