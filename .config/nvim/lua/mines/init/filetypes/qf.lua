local mappings = require 'mines/utils/mappings'
local vim = vim

return function()

  vim.api.nvim_command [[setlocal winminheight=1]]
  vim.api.nvim_command [[setlocal winheight=3]]
  vim.api.nvim_command [[setlocal nowrap]]
  vim.api.nvim_command [[setlocal norelativenumber]]
  vim.api.nvim_command [[setlocal number]]
  vim.api.nvim_command [[setlocal linebreak]]
  vim.api.nvim_command [[setlocal nolist]]
  vim.api.nvim_command [[setlocal cursorline]]
  vim.api.nvim_command [[setlocal nobuflisted]]

  vim.api.nvim_command [[wincmd J]]

  mappings.register_buffer_mappings {
    ['n<CR>'] = { [[<CR><C-w>p]], noremap = true},
    ['nsv'] = { [[<C-w><CR>]], noremap = true},
    ['nsg'] = { [[<C-w><Enter><C-w>L]], noremap = true},
    ['nst'] = { [[<C-w><CR><C-w>T]], noremap = true},
    ['nq'] = { [[:pclose!<CR>:quit<CR>]], silent = true, noremap = true},
    ['no'] = { [[<CR><C-w>p]], noremap = true},

    ['n mn'] = { [[:cnewer<CR>]], description = 'Newer list' },
    ['n mp'] = { [[:colder<CR>]], description = 'Older list'  },
    ['n ml'] = { [[:chistory<CR>]], description = 'List history' },
  }

  vim.api.nvim_command [[
    function! s:preview_file()
      silent! wincmd P
      if &previewwindow
        bdelete!
        return
      endif

      let winwidth = &columns
      let cur_list = b:qf_isLoc == 1 ? getloclist('.') : getqflist()
      let cur_line = getline(line('.'))
      let cur_file = fnameescape(substitute(cur_line, '|.*$', '', ''))
      if cur_line =~# '|\d\+'
        let cur_pos  = substitute(cur_line, '^\(.\{-}|\)\(\d\+\)\(.*\)', '\2', '')
        execute 'vertical pedit! +'.cur_pos.' '.cur_file
      else
        execute 'vertical pedit! '.cur_file
      endif
      wincmd P
      execute 'vert resize '.(winwidth / 2)
      wincmd p
    endfunction
  ]]
  vim.api.nvim_command [[ nnoremap <silent><buffer> p  :call <SID>preview_file()<CR> ]]

  vim.api.nvim_command [[let b:qf_isLoc = ! empty(getloclist(0))]]
  vim.api.nvim_command [[
    if b:qf_isLoc == 1
      nnoremap <buffer> O <CR>:lclose<CR>
    else
      nnoremap <buffer> O <CR>:cclose<CR>
    endif
  ]]
end
