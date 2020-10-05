local mappings = require 'mines/utils/mappings'
local vim = vim

return function()
  mappings.create_autocmds {
    { 'Syntax', 'magit', function() vim.api.nvim_command [[setlocal nofoldenable]] end };
  }
end
