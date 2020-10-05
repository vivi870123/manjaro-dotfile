local mappings = require 'mines/utils/mappings'
local vim = vim

return function()
  vim.api.nvim_command [[setlocal conceallevel=2]]
  vim.api.nvim_command("setlocal isfname=" .. vim.o.isfname .. ',@-@')

  vim.bo.makeprg = ('%s %s $*'):format(vim.g.typescript_compiler_binary, vim.g.typescript_compiler_options)

  mappings.register_buffer_mappings {
    ['n mc'] = { [[<Cmd>Make -p tsconfig.json<CR>]], description = 'Compile' },
  }
end
