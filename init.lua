--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("Options")
require("Requirements")
require('Onedark')
require('Lualine')
require('Telescope')
require('Treesitter')
require('Lsp')
require('Gitsigns')
require('Harpoon')
require('Ibl')
require('Mini')
require('Which')
require('Cmnt')
require("Remaps")

