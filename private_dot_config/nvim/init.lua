-- Bind leader key to space
vim.g.mapleader = " "

-- Load packer first
require 'plugins.packer'

require 'plugins.doge'
require 'plugins.lualine'
require 'plugins.treesitter'
require 'plugins.vista'

require 'modules.mappings'
require 'modules.settings'
