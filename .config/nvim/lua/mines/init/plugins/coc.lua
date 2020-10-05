local vim = vim

vim.api.nvim_command [[set keywordprg=:silent!\ call\ CocActionAsync('doHover')]]

-- Add `:Format` command to format current buffer.
vim.api.nvim_command [[command! -nargs=0 Format :call CocAction('format')]]

-- Add `:Fold` command to fold current buffer.
vim.api.nvim_command [[command! -nargs=? Fold :call CocAction('fold', <f-args>)]]

-- Add `:OR` command for organize imports of the current buffer.
vim.api.nvim_command [[command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')]]

local settings = {
  coc_force_debug = 1,
  coc_auto_open = [[v:false]],
  coc_disable_transparent_cursor = 1,
  coc_global_extensions = {
    'coc-actions',
    'coc-calc',
    'coc-css',
    'coc-diagnostic',
    'coc-docthis',
    'coc-emmet',
    'coc-eslint',
    'coc-git',
    'coc-gitignore',
    'coc-highlight',
    'coc-html',
    'coc-lists',
    'coc-jest',
    'coc-json',
    'coc-markdownlint',
    'coc-marketplace',
    'coc-phpls',
    'coc-prettier',
    'coc-project',
    'coc-python',
    'coc-sh',
    'coc-snippets',
    'coc-syntax',
    'coc-tsserver',
    'coc-vimlsp',
    'coc-word',
    'coc-yaml',
    'coc-yank',
  },

  -- coc-snippet
  coc_snippet_next = '<c-j>',
  coc_snippet_prev = '<c-k>',
}

for key,value in pairs(settings) do
  vim.g[key] = value
end
