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

-- local colorscheme_map = {
--     ["OldJobobo/miasma.nvim"]                     = "miasma",
--     ["loctvl842/monokai-pro.nvim"]                = "monokai-pro",
--     ["catppuccin/nvim"]                           = "catppuccin",
--     ["folke/tokyonight.nvim"]                     = "tokyonight",
--     ["navarasu/onedark.nvim"]                     = "onedark",
--     ["bjarneo/ash.nvim"]                          = "ash",
--     ["bjarneo/aether.nvim"]                       = "aether",
--     ["bjarneo/ethereal.nvim"]                     = "ethereal",
--     ["neanias/everforest-nvim"]                   = "everforest",
--     ["ellisonleao/gruvbox.nvim"]                  = "gruvbox",
--     ["bjarneo/hackerman.nvim"]                    = "hackerman",
--     ["rebelot/kanagawa.nvim"]                     = "kanagawa",
--     ["~/.config/omarchy/themes/frost/frost.nvim"] = 'onedark',
--     ['nil']                                       = 'onedark',
--     ["omacom-io/lumon.nvim"]                      = "lumon",
--     ["tahayvr/matteblack.nvim"]                   = "matteblack",
--     ["EdenEast/nightfox.nvim"]                    = "nordfox",
--     ["ribru17/bamboo.nvim"]                       = "bamboo",
--     ["OldJobobo/retro-82.nvim"]                   = "retro-82",
--     ["gthelding/monokai-pro.nvim"]                = "monokai-pro",
--     ["bjarneo/vantablack.nvim"]                   = "vantablack",
--     ["bjarneo/white.nvim"]                        = "white",
--     ["rose-pine/neovim"]                          = "rose-pine-dawn",
--     ["kepano/flexoki-neovim"]                     = "flexoki-light",
--     ["LazyVim/LazyVim"]                           = "onedark",
-- }

-- local themeGits = {

-- }

-- local aliases = {
--
-- }
-- local omarchyThemes = {
--     'Aetheria',
--     'Archwave',
--     'Ash',
--     'Ayaka',
--     'Blackgold',
--     'Catppuccin',
--     'Catppuccin Latte',
--     'City 783',
--     'Cpunk',
--     'Ethereal',
--     'Event Horizon',
--     'Everforest',
--     'Flexoki Light',
--     'Frost',
--     'Gruvbox',
--     'Hackerman',
--     'Jade Horse',
--     'Kanagawa',
--     'Last Horizon',
--     'Lumon',
--     'Lupine',
--     'Matte Black',
--     'Miasma',
--     'Nord',
--     'One Dark Pro',
--     'Osaka Jade',
--     'Retro 82',
--     'Ristretto',
--     'Rose Pine',
--     'Solitude',
--     'Starship',
--     'Tokyo Night',
--     'Vantablack',
--     'White',
-- }

vim.pack.add({
    -- themes
    -- "https://github.com/OldJobobo/miasma.nvim",
    -- "https://github.com/loctvl842/monokai-pro.nvim",
    -- "https://github.com/catppuccin/nvim",
    -- "https://github.com/folke/tokyonight.nvim",
    -- "https://github.com/navarasu/onedark.nvim",
    -- "https://github.com/bjarneo/ash.nvim",
    -- "https://github.com/bjarneo/aether.nvim",
    -- "https://github.com/bjarneo/ethereal.nvim",
    -- "https://github.com/neanias/everforest-nvim",
    -- "https://github.com/ellisonleao/gruvbox.nvim",
    -- "https://github.com/bjarneo/hackerman.nvim",
    -- "https://github.com/rebelot/kanagawa.nvim",
    -- "https://github.com/omacom-io/lumon.nvim",
    -- "https://github.com/tahayvr/matteblack.nvim",
    -- "https://github.com/EdenEast/nightfox.nvim",
    -- "https://github.com/ribru17/bamboo.nvim",
    -- "https://github.com/OldJobobo/retro-82.nvim",
    -- "https://github.com/bjarneo/vantablack.nvim",
    -- "https://github.com/bjarneo/white.nvim",
    -- "https://github.com/rose-pine/neovim",
    -- "https://github.com/kepano/flexoki-neovim",
    -- "https://github.com/LazyVim/LazyVim",

    -- Git
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/tpope/vim-rhubarb",
    "https://github.com/lewis6991/gitsigns.nvim",

    -- LSP
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/mason-org/mason-lspconfig.nvim',
    'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',

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
    "https://github.com/ArisPodotas/netrw.nvim",

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
    "https://github.com/folke/snacks.nvim",

    -- Debugger
    "https://github.com/mfussenegger/nvim-dap",
    "https://github.com/theHamsta/nvim-dap-virtual-text",
    "https://github.com/rcarriga/nvim-dap-ui",
    "https://github.com/nvim-neotest/nvim-nio",

    -- Auto-close brackets
    "https://github.com/windwp/nvim-autopairs",

    -- Autocompletion
    { src = "https://github.com/saghen/blink.lib" },
    'https://github.com/saghen/blink.cmp',

    -- Snippets
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/rafamadriz/friendly-snippets",

    -- Color highlighter
    "https://github.com/catgoose/nvim-colorizer.lua",

    -- Session persistence
    -- "https://github.com/folke/persistence.nvim",

    -- Search result virtual text
    "https://github.com/kevinhwang91/nvim-hlslens",

    -- Bookmarks
    "https://github.com/TheNoeTrevino/haunt.nvim",

    -- xp for insert mode stuff
    { src = 'https://github.com/nvzone/volt' },
    { src = 'https://github.com/DrKJeff16/triforce.nvim' },

    -- xp for normal mode
    "https://github.com/jakewaldrip/vimscape2007.nvim",

})

require("Config.Onedark") -- Needs to be up here
require("Config.Colors")
require("Config.Lualine")

require("Config.Telescope")

require("Config.LSP.Treesitter")
require("Config.LSP.Blink")
require("Config.LSP.Lsp")
require("Config.LSP.Diagnostics")
require('Config.LSP.Autotag')
require("Config.LSP.Debug")
require('Config.LSP.Pair')

-- require('Config.Animations')
require('Config.Aerials')
require("Config.Git")
require("Config.Harpoon")
require("Config.Ibl")
require("Config.Which")

require('Config.Mini') -- contains comment, map, surround, leap, icons
require('Config.Snak') -- contains dashboard, dim -- dashboard is ruined in v12
require('Config.Netrw')
require('Config.Triforce')
require('Config.Runescape')

require("Remaps")
require('Tabar')

-- For html highlights since for some reason it does not load it
vim.opt.rtp:append(
    vim.fn.stdpath('data') .. '/site/pack/core/opt/nvim-treesitter/runtime'
)
