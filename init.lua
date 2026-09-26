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

vim.pack.add({
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
    --
    { src = "https://github.com/saghen/blink.lib" },
    {src = "https://github.com/saghen/blink.cmp"},

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
})

require("Config.Onedark") -- Needs to be up here
require("Config.Colors")
require("Config.Lualine")

require("Config.Telescope")

require("Config.LSP.Treesitter") -- removed
require("Config.LSP.Blink") -- removed
require("Config.LSP.Lsp") -- removed
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

require("Remaps")
require('Tabar')

-- _G.DARK_THEME = "onedark"   -- fallback or preferred alt-theme

-- -- Apply the colorscheme
-- if _G.OS_THEME and _G.OS_THEME ~= 'onedark' then
--     vim.cmd("colorscheme " .. _G.OS_THEME)
-- -- Your special case
-- elseif _G.OS_THEME == "onedark" or _G.OS_THEME == nil then
--     require("Config.Onedark")
-- else
--     require("Config.Onedark")
-- end

-- -- Optional setup for themes that support it
-- pcall(function()
--     require(_G.OS_THEME).setup({})
-- end)

-- local function apply_theme(name)
--     if name == 'onedark' or name == nil then
--         vim.cmd("colorscheme " .. name) -- Required to set the vim.g.colors_name
--         require("Config.Onedark")
--     else
--         vim.cmd("colorscheme " .. name)
--         -- theme-specific setup (safe)
--         -- pcall(function()
--         --     require(name).setup({})
--         -- end)
--     end
--     -- print("Theme switched to: " .. name)
-- end

-- -- Toggle function to switch between OS theme and the fallback dark theme
-- local function toggle_theme()
--     local current = vim.g.colors_name
--     if current == _G.OS_THEME then
--         apply_theme(_G.DARK_THEME)
--     else
--         apply_theme(_G.OS_THEME)
--     end
-- end

-- vim.keymap.set("n", "<leader>c", toggle_theme, { desc = "Toggle colorscheme" })

-- require("Config.Onedark")
-- require('colorizer').setup()
