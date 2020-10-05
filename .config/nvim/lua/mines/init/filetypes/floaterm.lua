local mappings = require 'mines/utils/mappings'

mappings.register_buffer_mappings {
  ['n[['] =  { [[?❯<CR>]], silent = true},
  ['n]]'] =  { [[/❯<CR>]], silent = true},
};
