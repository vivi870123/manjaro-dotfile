local vim = vim

return function()
  vim.api.nvim_command [[setlocal tabstop=4]]
  vim.api.nvim_command [[setlocal softtabstop=4]]
  vim.api.nvim_command [[setlocal shiftwidth=4]]
  vim.api.nvim_command [[setlocal smarttab]]
  vim.api.nvim_command [[setlocal nosmartindent]]
  vim.api.nvim_command [[setlocal noexpandtab]]
end
