--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("options")
require("requirements")
require('Telescope')
require('Treesitter')
require('Which')
require('Lsp')
require('Harpoon')
require('Ibl')
require('Mini')
require("remaps")

