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
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/tpope/vim-rhubarb",
    "https://github.com/neovim/nvim-lspconfig",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/ewis6991/gitsigns.nvim",
	"https://github.com/avarasu/onedark.nvim",
	"https://github.com/vim-lualine/lualine.nvim",
    "https://github.com/vim-tree/nvim-web-devicons",
    "https://github.com/vim-telescope/telescope.nvim",
    "https://github.com/vim-lua/plenary.nvim",
    "https://github.com/urntSushi/ripgrep",
    'https://github.com/indwp/nvim-ts-autotag',
    'https://github.com/tevearc/aerial.nvim',
    "https://github.com/vim-treesitter/nvim-treesitter",
    "https://github.com/vim-treesitter/nvim-treesitter-textobjects",
    "https://github.com/vim-treesitter/nvim-treesitter-context",
    "https://github.com/richrd/netrw.nvim",
},

{
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    commit = "e76cb03",
    dependencies = { "nvim-lua/plenary.nvim" },
},
{
    -- indentation guide
    -- See `:help ibl`
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
},

-- A conglomerate
{ "echasnovski/mini.nvim", version = false },

-- A conglomerate
{
    "folke/snacks.nvim",
    priority = 1000,
    lazy = true,
},

-- Debugger
{
    "mfussenegger/nvim-dap",
    dependencies = {
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "williamboman/mason.nvim",
    },
    config = function()
        require("nvim-dap-virtual-text").setup()
        require("dapui").setup()
    end,
},

-- Close my brackets automatically
{
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
},

{ -- Autocompletion
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    version = "1.*",
    dependencies = {
        -- 'Kaiser-Yang/blink-cmp-avante',
        -- Snippet Engine
        {
            "L3MON4D3/LuaSnip",
            event = "InsertEnter",
            version = "2.*",
            build = (function()
                -- Build Step is needed for regex support in snippets.
                -- This step is not supported in many windows environments.
                -- Remove the below condition to re-enable on windows.
                if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
                    return
                end
                return "make install_jsregexp"
            end)(),
            dependencies = {
                {
                    "rafamadriz/friendly-snippets",
                    config = function()
                        require("luasnip.loaders.from_vscode").lazy_load()
                    end,
                },
            },
            opts = {},
        },
        -- "folke/lazydev.nvim",
    },
},

-- lazy.nvim
{
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {},
},

-- Never start from blank kinda invalidates snack screen
{
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
        -- add any custom options here
    }
},

-- Convenient virtual text for the search query
{
    "kevinhwang91/nvim-hlslens",
    event = "VeryLazy",
    config = function()
        require("hlslens").setup()
    end,
},

-- Cool virtual text notes
{
    "TheNoeTrevino/haunt.nvim",
    -- default config: change to your liking, or remove it to use defaults
    ---@class HauntConfig
    opts = {
        sign = "󱙝",
        sign_hl = "DiagnosticInfo",
        virt_text_hl = "HauntAnnotation", -- links to DiagnosticVirtualTextHint
        annotation_prefix = " 󰆉 ",
        annotation_suffix = "",
        line_hl = nil,
        virt_text_pos = "eol",
        data_dir = nil,
        per_branch_bookmarks = true,
        picker = "auto", -- "auto", "snacks", "telescope", or "fzf"
        picker_keys = { -- picker agnostic, we got you covered
            delete = { key = "d", mode = { "n" } },
            edit_annotation = { key = "a", mode = { "n" } },
        },
    },
    -- recommended keymaps, with a helpful prefix alias
    init = function()
        local haunt = require("haunt.api")
        local haunt_picker = require("haunt.picker")
        local map = vim.keymap.set
        local prefix = "<leader>h"

        -- annotations
        map("n", prefix .. "a", function()
            haunt.annotate()
        end, { desc = "Annotate" })

        map("n", prefix .. "t", function()
            haunt.toggle_annotation()
        end, { desc = "Toggle annotation" })

        map("n", prefix .. "T", function()
            haunt.toggle_all_lines()
        end, { desc = "Toggle all annotations" })

        map("n", prefix .. "d", function()
            haunt.delete()
        end, { desc = "Delete bookmark" })

        map("n", prefix .. "C", function()
            haunt.clear_all()
        end, { desc = "Delete all bookmarks" })

        -- move
        map("n", prefix .. "p", function()
            haunt.prev()
        end, { desc = "Previous bookmark" })

        map("n", prefix .. "n", function()
            haunt.next()
        end, { desc = "Next bookmark" })

        -- picker
        map("n", prefix .. "l", function()
            haunt_picker.show()
        end, { desc = "Show Picker" })

        -- quickfix 
        map("n", prefix .. "q", function()
            haunt.to_quickfix()
        end, { desc = "Send Hauntings to QF Lix (buffer)" })

        map("n", prefix .. "Q", function()
            haunt.to_quickfix({ current_buffer = true })
        end, { desc = "Send Hauntings to QF Lix (all)" })

        -- yank
        map("n", prefix .. "y", function()
            haunt.yank_locations({current_buffer = true})
        end, { desc = "Send Hauntings to Clipboard (buffer)" })

        map("n", prefix .. "Y", function()
            haunt.yank_locations()
        end, { desc = "Send Hauntings to Clipboard (all)" })

    end,
},

    -- Makes inline ghost text
    -- {
    --     "folke/todo-comments.nvim",
    --     dependencies = { "nvim-lua/plenary.nvim" },
    --     opts = {
    --         search = {
    --             command = "rg",
    --             args = {
    --                 "--color=never",
    --                 "--no-heading",
    --                 "--with-filename",
    --                 "--line-number",
    --                 "--column",
    --             },
    --             -- regex that will be used to match keywords.
    --             -- don't replace the (KEYWORDS) placeholder
    --             -- pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    --             pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
    --         },
    --         -- your configuration comes here
    --         -- or leave it empty to use the default settings
    --         -- refer to the configuration section below
    --     }
    -- },

    -- cool jump animation
    -- not working
    -- {
    --     'edluffy/specs.nvim',
    --     opts = {}
    -- },

    -- Cool resize windon on jump
    -- { "anuvyklack/windows.nvim",
    --    dependencies = {
    --       "anuvyklack/middleclass",
    --       "anuvyklack/animation.nvim"
    --    },
    --    config = function()
    --       vim.o.winwidth = 10
    --       vim.o.winminwidth = 10
    --       vim.o.equalalways = false
    --       require('windows').setup()
    --    end
    -- },

    -- {
    --     "folke/noice.nvim",
    --     opts = {
    --         messages = {
    --             view_search = "virtualtext",  -- this enables showing the search count as virtual text
    --         },
    --     },
    --     dependencies = {
    --         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --         "MunifTanjim/nui.nvim",
    --         -- OPTIONAL:
    --         --   `nvim-notify` is only needed, if you want to use the notification view.
    --         --   If not available, we use `mini` as the fallback
    --         "rcarriga/nvim-notify",
    --     }
    -- },
    -- Change the color of matching pairs of delimiters
    -- { HiPhish/rainbow-delimiters.nvim },

	-- AI
	-- { "supermaven-inc/supermaven-nvim" },
    -- require('Config.Avant')

    -- Smooth scrolling
    -- {
        -- karb94/neoscroll.nvim
    -- },

    -- Jupyter notebooks
    -- {
        -- kiyoon/jupynium.nvim
    -- },

    -- {
        -- meznaric/key-analyzer.nvim
    -- },

    -- {
        -- sQVe/sort.nvim
    -- },

    -- Generate docs automatically
    -- { 
    --     "danymat/neogen", 
    --     config = true,
    --     -- Uncomment next line if you want to follow only stable versions
    --     -- version = "*" 
    -- },

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
