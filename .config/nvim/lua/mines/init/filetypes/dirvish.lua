local mappings = require 'mines/utils/mappings'
local vim = vim

local M = {}

function M.create_directory()
  local filehead = vim.fn.expand '<cfile>:h'
  local dirname = vim.fn.input 'Create directory: '
  if dirname ~= '' then
    vim.api.nvim_command(('!mkdir %s/%s'):format(filehead, dirname))
    vim.api.nvim_input 'R'
  end
end

function M.create_file()
  local filehead = vim.fn.expand '<cfile>:h'
  local filename = vim.fn.input 'Create file: '

  if filename ~= '' then
    vim.api.nvim_command(('!touch %s/%s'):format(filehead, filename))
    vim.api.nvim_input 'R'
  end
end

function M.rename_file_or_dir()
  local filename = vim.fn.expand '<cfile>:t'
  local filepath = vim.fn.expand '<cfile>'
  local filehead = vim.fn.expand '<cfile>:h'
  local new_name = vim.fn.input('Rename file: ', filename)

  if new_name ~= '' and new_name ~= filename then
    vim.api.nvim_command(('!mv %s %s/%s'):format(filepath, filehead, new_name))
    vim.api.nvim_input 'R'
  end
end

function M.move_file_or_dir()
  local filepath = vim.fn.expand '<cfile>'
  local new_path = vim.fn.input('Move file to : ', filepath)

  if new_path ~= '' and new_path ~= filepath then
    vim.api.nvim_command(('!mv %s %s'):format(filepath, new_path))
    vim.api.nvim_input 'R'
  end
end

function M.copy_file_or_dir()
  local filepath = vim.fn.expand '<cfile>'
  local new_path = vim.fn.input('Copy file to : ', filepath)

  if new_path ~= '' and new_path ~= filepath then
    vim.api.nvim_command(('!cp %s %s'):format(filepath, new_path))
    vim.api.nvim_input 'R'
  end
end

function M.remove_file_or_directory()
  local filepath = vim.fn.expand '<cfile>'
  local confirmed = vim.fn.confirm(('Delete %s?'):format(filepath))

  if confirmed == 1 then
    mines.command(('!trash %s'):format(filepath))
    vim.api.nvim_input 'R'
  end
end

return function()
  mines.command("setlocal nospell")
  vim.api.nvim_command("setlocal signcolumn=no")

  mines.mappings.init_buffer_mappings {
    g = { name = '+goto' }
  }

  mines.mappings.register_buffer_mappings {
    ['n md'] =  { function() M.create_directory() end, description = 'Make directory' },
    ['n mf'] =  { function() M.create_file() end, description = 'Create file' },
    ['n mr'] =  { function() M.rename_file_or_dir() end, description = 'Rename' },
    ['n mm'] =  { function() M.move_file_or_dir() end, description = 'Move' },
    ['n mc'] =  { function() M.copy_file_or_dir() end, description = 'Copy' },
    ['n mk'] =  { function() M.remove_file_or_directory() end, description = 'Delete' },
    ['n q'] =   { [[gq]], noremap = false },
    ['n Q'] =   { [[gq]], noremap = false },

    ['nh'] =  { [[<Plug>(dirvish_up)]] },
    ['nl'] = { [[:<C-U>.call dirvish#open("edit", 0)<CR>]] },
    ['nq'] = { [[gq]], noremap = false },
    ['nK'] = { function() M.create_directory() end },
    ['nN'] = { function() M.create_file() end },
    ['nr'] = { function() M.remove_file_or_directory() end },
    ['nm'] = { function() M.move_file_or_dir() end },
    ['nc'] = { function() M.copy_file_or_dir() end },
    ['ndd'] = { function() M.remove_file_or_directory() end },
    ['nsg'] = { [[:<C-U>call dirvish#open("vsplit", 1)<CR>]] },
    ['nsv'] = { [[:<C-U>call dirvish#open("split", 1)<CR>]] },
  };

  mines.command [[autocmd FileType dirvish silent! unmap <buffer> a]]
  mines.command [[autocmd FileType dirvish silent! unmap <buffer> o]]
end
