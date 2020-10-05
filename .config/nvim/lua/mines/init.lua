local colorizer = require 'colorizer'

require "mines"

require "mines/init/settings"
require "mines/init/plugins/plugin_settings"
require "mines/init/plugins/lightline"
require "mines/init/plugins/coc"
require 'mines/init/mappings'
require 'mines/init/filetypes'
require "mines/init/commands"

colorizer.setup {
  'css',
  'sass',
  'less',
  'typescript',
  'javascript',
  'vim',
  'html',
  'lua'
}

