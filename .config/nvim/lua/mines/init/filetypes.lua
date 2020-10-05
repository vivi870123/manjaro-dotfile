local mappings = require 'mines/utils/mappings'

__LUA_FILETYPE_HOOKS = {
  dirvish = require 'mines/init/filetypes/dirvish',
  help = require "mines/init/filetypes/help",
  lua = require 'mines/init/filetypes/lua',
  magit = require 'mines/init/filetypes/magit',
  markdown = require 'mines/init/filetypes/qf',
  php = require 'mines/init/filetypes/php',
  python = require 'mines/init/filetypes/python',
  qf = require 'mines/init/filetypes/qf',
  startify = require 'mines/init/filetypes/startify',
  typescript = require 'mines/init/filetypes/typescript',
}

local autocmds = {}

for filetype,fn in pairs(__LUA_FILETYPE_HOOKS) do
  autocmds['LuaFiletypeHooks_' .. mines.mappings.escape_keymap(filetype)] = {
    { 'FileType', filetype, ("lua __LUA_FILETYPE_HOOKS[%q]()"):format(filetype) }
  }
end

mappings.create_augroups(autocmds)
