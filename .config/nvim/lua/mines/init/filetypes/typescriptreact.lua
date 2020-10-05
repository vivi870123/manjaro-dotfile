local vim = vim

return function()
  vim.api.nvim_command [[execute 'noautocmd set filetype=' . substitute(&filetype, 'typescriptreact', 'typescript.tsx', '') ]]
end
