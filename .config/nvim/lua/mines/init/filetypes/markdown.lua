local mappings = require 'mines/utils/mappings'
local vim = vim

return function()
  vim.api.nvim_command [[setlocal nospell]]
  vim.api.nvim_command [[setlocal nolist]]
  vim.api.nvim_command [[setlocal linebreak]]
  vim.api.nvim_command [[setlocal speelllang=en_gb]]
  vim.api.nvim_command [[setlocal colorcolumn=120]]
  vim.api.nvim_command [[setlocal textwidth=120]]
  vim.api.nvim_command [[setlocal wrapmargin=120]]
  vim.api.nvim_command [[setlocal comments=n:>]]


  mappings.register_buffer_mappings {
    ['n mp'] = { [[<Plug>MarkdownPreview]], noremap = false, description = "Preview" };
  }

  -- Highlight words to avoid in tech writing
  -- http://css-tricks.com/words-avoid-educational-writing/
  -- https://github.com/pengwynn/dotfiles
  vim.api.nvim_command = [[ highlight TechWordsToAvoid ctermbg=red ctermfg=white ]]
  vim.api.nvim_command = [[
    function! MatchTechWordsToAvoid()
      match TechWordsToAvoid /\c\(obviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy\)/
    endfunction
  ]]

  vim.api.nvim_command [[call MatchTechWordsToAvoid()]]
  vim.api.nvim_command [[ autocmd BufWinEnter *.md call MatchTechWordsToAvoid() ]]
  vim.api.nvim_command [[ autocmd InsertEnter *.md call MatchTechWordsToAvoid() ]]
  vim.api.nvim_command [[ autocmd InsertLeave *.md call MatchTechWordsToAvoid() ]]
  vim.api.nvim_command [[ autocmd BufWinLeave *.md call clearmatches() ]]
end
