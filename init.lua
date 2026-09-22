--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
--
-- 
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("Options")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd(
    "TextYankPost", {
        desc = "Highlight when yanking (copying) text",
        group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
        callback = function()
            vim.hl.on_yank()
        end,
    }
)

vim.pack.add({
    -- Git
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/tpope/vim-rhubarb",
    "https://github.com/lewis6991/gitsigns.nvim",

    -- LSP
    "https://github.com/neovim/nvim-lspconfig",

    -- Keybinding hints
    "https://github.com/folke/which-key.nvim",

    -- Theme & UI
    "https://github.com/navarasu/onedark.nvim",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",

    -- Fuzzy finder
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-lua/plenary.nvim",

    -- Treesitter
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
    "https://github.com/nvim-treesitter/nvim-treesitter-context",

    -- HTML auto-close
    "https://github.com/windwp/nvim-ts-autotag",

    -- Code outline
    "https://github.com/stevearc/aerial.nvim",

    -- File explorer
    "https://github.com/prichrd/netrw.nvim",

    -- Quick file navigation
    {
        src = "https://github.com/ThePrimeagen/harpoon",
        version = "e76cb03",
    },

    -- Indentation guides
    "https://github.com/lukas-reineke/indent-blankline.nvim",

    -- Mini
    "https://github.com/echasnovski/mini.nvim",

    -- Snacks
    -- "https://github.com/folke/snacks.nvim",

    -- Debugger
    "https://github.com/mfussenegger/nvim-dap",
    "https://github.com/theHamsta/nvim-dap-virtual-text",
    "https://github.com/rcarriga/nvim-dap-ui",
    "https://github.com/nvim-neotest/nvim-nio",
    "https://github.com/williamboman/mason.nvim",

    -- Auto-close brackets
    "https://github.com/windwp/nvim-autopairs",

    -- Autocompletion
    -- "https://github.com/saghen/blink.cmp",

    -- Snippets
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/rafamadriz/friendly-snippets",

    -- Color highlighter
    "https://github.com/catgoose/nvim-colorizer.lua",

    -- Session persistence
    "https://github.com/folke/persistence.nvim",

    -- Search result virtual text
    "https://github.com/kevinhwang91/nvim-hlslens",

    -- Bookmarks
    "https://github.com/TheNoeTrevino/haunt.nvim",
})

require("Config.Onedark") -- Needs to be up here
require("Config.Colors")
require("Config.Lualine")

require("Config.Telescope")
-- require("Config.LSP.Treesitter")
-- require("Config.LSP.Blink")
-- require("Config.LSP.Lsp")
require("Config.LSP.Diagnostics")
require('Config.LSP.Autotag')
require("Config.LSP.Debug")
require('Config.LSP.Pair') -- Just better
-- require('Config.Animations')
require('Config.Aerials')
require("Config.Git")
require("Config.Harpoon")
require("Config.Ibl")
require("Config.Which")

require('Config.Mini') -- contains comment, map, surround, leap, icons
-- require('Config.Snak') -- contains dashboard, dim

require("Remaps.Remaps")
require("Remaps.Insert")
require("Remaps.Splits")
-- require("Remaps.Autosave")

-- Plugins
require('plugins.tabcus')
