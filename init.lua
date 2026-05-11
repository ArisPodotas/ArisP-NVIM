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
    "https://github.com/lewis6991/gitsigns.nvim",           -- fix: ewis6991 → lewis6991
    -- LSP
    "https://github.com/neovim/nvim-lspconfig",
    -- Keybinding hints
    "https://github.com/folke/which-key.nvim",
    -- Theme & UI
    "https://github.com/navarasu/onedark.nvim",             -- fix: avarasu → navarasu
    "https://github.com/nvim-lualine/lualine.nvim",         -- fix: vim-lualine → nvim-lualine
    "https://github.com/nvim-tree/nvim-web-devicons",       -- fix: vim-tree → nvim-tree
    -- Fuzzy finder + deps
    "https://github.com/nvim-telescope/telescope.nvim",     -- fix: vim-telescope → nvim-telescope
    "https://github.com/nvim-lua/plenary.nvim",             -- fix: vim-lua → nvim-lua
    -- NOTE: ripgrep (BurntSushi/ripgrep) is a CLI tool, not a Neovim plugin.
    --       Install it via your system package manager: brew/apt/scoop install ripgrep
    -- Treesitter (core required by context + textobjects)
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", -- fix: vim-treesitter → nvim-treesitter
    "https://github.com/nvim-treesitter/nvim-treesitter-context",     -- fix: vim-treesitter → nvim-treesitter
    -- HTML auto-close tags (requires treesitter)
    "https://github.com/windwp/nvim-ts-autotag",            -- fix: indwp → windwp
    -- Code outline / symbol navigation
    "https://github.com/stevearc/aerial.nvim",              -- fix: tevearc → stevearc
    -- File explorer
    "https://github.com/prichrd/netrw.nvim",                -- fix: richrd → prichrd
    -- Quick file navigation
    {
        source = "https://github.com/ThePrimeagen/harpoon",
        branch = "harpoon2",
        commit = "e76cb03",
    },
    -- Indentation guides
    {
        source = "https://github.com/lukas-reineke/indent-blankline.nvim",
        main = "ibl",
    },
    -- Mini plugins suite
    { source = "https://github.com/echasnovski/mini.nvim", version = false },
    -- Snacks (notifications, dashboard, etc.)
    { source = "https://github.com/folke/snacks.nvim", priority = 1000 },
    -- Debugger (DAP)
    "https://github.com/mfussenegger/nvim-dap",
    "https://github.com/theHamsta/nvim-dap-virtual-text",
    "https://github.com/rcarriga/nvim-dap-ui",
    "https://github.com/nvim-neotest/nvim-nio",
    "https://github.com/williamboman/mason.nvim",
    -- Auto-close brackets
    {
        source = "https://github.com/windwp/nvim-autopairs",
        event = "InsertEnter",
    },
    -- Autocompletion
    {
        source = "https://github.com/saghen/blink.cmp",
        version = "1.*",
    },
    -- Snippet engine
    {
        source = "https://github.com/L3MON4D3/LuaSnip",
        version = "2.*",
    },
    "https://github.com/rafamadriz/friendly-snippets",
    -- Color highlighter (#fff, rgb(), etc.)
    "https://github.com/catgoose/nvim-colorizer.lua",
    -- Session persistence
    "https://github.com/folke/persistence.nvim",
    -- Search result virtual text
    "https://github.com/kevinhwang91/nvim-hlslens",
    -- Inline annotation / bookmarks
    "https://github.com/TheNoeTrevino/haunt.nvim",
})
require("Config.Onedark") -- Needs to be up here
require("Config.Colors")
require("Config.Lualine")

require("Config.Telescope")
require("Config.LSP.Treesitter")
require("Config.LSP.Lsp")
require("Config.LSP.Blink")
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
require('Config.Snak') -- contains dashboard, dim

require("Remaps.Remaps")
require("Remaps.Insert")
require("Remaps.Splits")
-- require("Remaps.Autosave")

-- Plugins
require('plugins.tabcus')
