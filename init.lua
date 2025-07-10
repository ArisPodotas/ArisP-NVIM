--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("Options")

require("Requirements")

require("Config.Onedark")
require("Config.Lualine")
require("Config.Telescope")
require("Config.Treesitter")
require("Config.Lsp")
require("Config.Blink")
require("Config.Diagnostics")
-- require('Config.Conform')
require("Config.Gitsigns")
-- require("Config.Mark")
require("Config.Harpoon")
require("Config.Ibl")
require("Config.Debug")
require("Config.Which")
require('Config.Pair') -- Just better

require("Config.Mini.Icons")
-- require('Config.Mini.Map')
require('Config.Mini.Surround')
require('Config.Mini.Comment')
require('Config.Mini.Leap')
-- require("Config.Mini.Pairs")
-- require("Config.Mini.Starter")
-- require("Config.Mini.Around")

require('Config.Snak')

-- require("Config.AI")

-- require("Remaps.Autosave")
require("Remaps.Git")
require("Remaps.Netrw")
require("Remaps.Remaps")
require("Remaps.Splits")
require("Remaps.Tabs")
require("Remaps.Telescope")
require("Remaps.Terminals")

-- require('Plugins.FloatingTerm')
-- require('Plugins.FloatingNotes')

