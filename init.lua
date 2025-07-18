--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("Options")

require("Requirements")

require("Config.QOL.Onedark")
require("Config.QOL.Lualine")
require("Config.QOL.Telescope")
require("Config.LSP.Treesitter")
require("Config.LSP.Lsp")
require("Config.LSP.Blink")
require("Config.LSP.Diagnostics")
require('Config.LSP.Autotag')
require('Config.QOL.Aerials')
require('Config.QOL.Colorizer')
require('Config.QOL.Notify')
require("Config.QOL.Git")
require("Config.QOL.Harpoon")
require("Config.QOL.Ibl")
require("Config.LSP.Debug")
require("Config.QOL.Which")
require('Config.QOL.Pair') -- Just better

require("Config.Mini.Icons")
require('Config.Mini.Map')
require('Config.Mini.Surround')
require('Config.Mini.Comment')
require('Config.Mini.Leap')

require('Config.QOL.Snak')

require("Remaps.Remaps")
require("Remaps.Insert")
require("Remaps.Splits")
require("Remaps.Tabs")
require("Remaps.Terminals")

