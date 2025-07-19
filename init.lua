--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("Options")

require("Requirements")

require("Config.Onedark") -- keep in mind this has alot more than just one dark
require("Config.Lualine")
require("Config.Telescope")
require("Config.LSP.Treesitter")
require("Config.LSP.Lsp")
require("Config.LSP.Blink")
require("Config.LSP.Diagnostics")
require('Config.LSP.Autotag')
require("Config.LSP.Debug")
require('Config.LSP.Pair') -- Just better
require('Config.Animations')
require('Config.Aerials')
require("Config.Git")
require("Config.Harpoon")
require("Config.Ibl")
require("Config.Which")

require('Config.Mini') -- contains comment, map, surround, leap, icons
require('Config.Snak') -- contains dashboard, dim

require("Remaps.Remaps")
require("Remaps.Insert")
require("Remaps.Splits")

