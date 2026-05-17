--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
--
-- 
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("Options")

require('Requirements')

require('Styles')
require("Config.Lualine")

require("Config.Telescope")
require("Config.Treesitter")
require("Config.Lsp")
require("Config.Blink")
require("Config.Diagnostics")
require('Config.Autotag')
require("Config.Debug")
require('Config.Pair') -- Just better
-- require('Config.Animations')
require('Config.Aerials')
require("Config.Git")
require("Config.Harpoon")
require("Config.Ibl")
require("Config.Which")

require('Config.Mini') -- contains comment, map, surround, leap, icons
require('Config.Snak') -- contains dashboard, dim

require("Remaps")

-- Plugins
require('Tabline')
