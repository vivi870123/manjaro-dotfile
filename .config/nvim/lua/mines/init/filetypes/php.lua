local mappings = require 'mines/utils/mappings'
local vim = vim

local function add_missing_properties()
  local file_path = vim.fn.expand '%:p'
  vim.api.nvim_command (('silent !phpactor class:transform %s --transform=add_missing_properties'):format(file_path))
end

local function fix_namespace_or_classname()
  local file_path = vim.fn.expand '%:p'
  vim.api.nvim_command (('silent !phpactor class:transform %s --transform=fix_namespace_class_name'):format(file_path))
end

local function implement_contracts()
  local file_path = vim.fn.expand '%:p'
  vim.api.nvim_command (('silent !phpactor class:transform %s --transform=implement_contracts'):format(file_path))
end

local function complete_constructor()
  local file_path = vim.fn.expand '%:p'
  vim.api.nvim_command (('silent !phpactor class:transform %s --transform=implement_contracts'):format(file_path))
end

return function()
  vim.api.nvim_command [[setlocal iskeyword+=$]]

  mappings.init_buffer_mappings {
    g = { name = '+generate' },
    f = { name = '+fix',      i = { name = '+import' }},
    r = { name = '+refactor', e = { name = '+extract' }}
  }

  mappings.register_buffer_mappings {
    ['n mfa']  = { function() add_missing_properties()  end, description = 'Add missing properties' },
    ['n mfc']  = { function() complete_constructor()  end, description = 'Complete constructor' },
    ['n mff']  = { function() fix_namespace_or_classname() end, description = 'Fix Namespace' },
    ['n mfI']  = { function() implement_contracts() end, description = 'Implement contract' },
    ['n mfe']  = { [[<cmd>PhpactorClassExpand<cr>]], description = 'Expand class' },
    ['n mfA']  = { [[<cmd>PhpactorGenerateAccessor<cr>]], description = 'Generate accessors' },
    ['n mfic'] = { [[<cmd>PhpactorImportClass<cr>]], description = 'Import class' },
    ['n mfim'] = { [[<cmd>PhpactorImportMissingClasses<cr>]], description = 'Find missing classes' },
    ['n mgn']  = { [[<cmd>PhpactorClassNew<cr>]], description = 'New class' },
    ['n mgc']  = { [[<cmd>PhpactorCopyFilecr<cr>]], description = 'Copy class' },
    ['n mge']  = { [[<cmd>PhpactorClassInflect<cr>]], description = 'Extract interface' },

    ['n mv']   = { [[<cmd>PhpactorChangeVisibility<cr>]], description = 'Change visibility' },
    ['n mrm']  = { [[<cmd>PhpactorMoveFile<cr>]], description = 'Move file' },
    ['v mree'] = { [[<cmd>PhpactorExtractExpression<cr>]], description = 'Expression' },
    ['v mrem'] = { [[<cmd>PhpactorExtractMethod<cr>]], description = 'Method' },

    ['n;v'] =  { [[<cmd>PhpactorChangeVisibility<cr>]], description = 'Change visibility' },

    -- common shortcuts
    ['i,,'] = { [[->]] },
    ['i,t'] = { [[$this->]] },
    ['i,r'] = { [[return ;<esc>i]] },
    ['i;a'] = { [[<esc>A;<cr>]] },
  };
end
