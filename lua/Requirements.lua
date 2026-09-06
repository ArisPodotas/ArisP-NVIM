local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system(
        {
            "git",
            "clone",
            "--filter=blob:none",
            "--branch=stable",
            lazyrepo,
            lazypath,
        }
    )
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

-- NO idea what this does it was in kickstart
---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

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

local colorscheme_map = {
    ["OldJobobo/miasma.nvim"]                     = "miasma",
    ["loctvl842/monokai-pro.nvim"]                = "monokai-pro",
    ["catppuccin/nvim"]                           = "catppuccin",
    ["folke/tokyonight.nvim"]                     = "tokyonight",
    ["navarasu/onedark.nvim"]                     = "onedark",
    ["bjarneo/ash.nvim"]                          = "ash",
    ["bjarneo/aether.nvim"]                       = "aether",
    ["bjarneo/ethereal.nvim"]                     = "ethereal",
    ["neanias/everforest-nvim"]                   = "everforest",
    ["ellisonleao/gruvbox.nvim"]                  = "gruvbox",
    ["bjarneo/hackerman.nvim"]                    = "hackerman",
    ["rebelot/kanagawa.nvim"]                     = "kanagawa",
    ["~/.config/omarchy/themes/frost/frost.nvim"] = 'onedark',
    ['nil']                                       = 'onedark',
    ["omacom-io/lumon.nvim"]                      = "lumon",
    ["tahayvr/matteblack.nvim"]                   = "matteblack",
    ["EdenEast/nightfox.nvim"]                    = "nordfox",
    ["ribru17/bamboo.nvim"]                       = "bamboo",
    ["OldJobobo/retro-82.nvim"]                   = "retro-82",
    ["gthelding/monokai-pro.nvim"]                = "monokai-pro",
    ["bjarneo/vantablack.nvim"]                   = "vantablack",
    ["bjarneo/white.nvim"]                        = "white",
    ["rose-pine/neovim"]                          = "rose-pine-dawn",
    ["kepano/flexoki-neovim"]                     = "flexoki-light",
    ["LazyVim/LazyVim"]                           = "onedark",
}

-- local function getTheme()
--     local themePath = vim.fn.expand("~/.config/omarchy/current/theme/neovim.lua")
--     local theme_spec = dofile(themePath)
--     -- The theme plugin is ALWAYS the first item
--     local plugin_spec = theme_spec[1]
--     local plugin_name = plugin_spec[1]
--     return plugin_spec, plugin_name
-- end

-- local theme_plugin, plugin_name = getTheme()
-- _G.OS_THEME = colorscheme_map[plugin_name]

require("lazy").setup({
    -- theme_plugin, -- My colorscheme
    {"OldJobobo/miasma.nvim"},
    {"loctvl842/monokai-pro.nvim"},
    {"catppuccin/nvim"},
    {"folke/tokyonight.nvim"},
    {"navarasu/onedark.nvim"},
    {"bjarneo/ash.nvim"},
    {"bjarneo/aether.nvim"},
    {"bjarneo/ethereal.nvim"},
    {"neanias/everforest-nvim"},
    {"ellisonleao/gruvbox.nvim"},
    {"bjarneo/hackerman.nvim"},
    {"rebelot/kanagawa.nvim"},
    {"omacom-io/lumon.nvim"},
    {"tahayvr/matteblack.nvim"},
    {"EdenEast/nightfox.nvim"},
    {"ribru17/bamboo.nvim"},
    {"OldJobobo/retro-82.nvim"},
    {"gthelding/monokai-pro.nvim"},
    {"bjarneo/vantablack.nvim"},
    {"bjarneo/white.nvim"},
    {"rose-pine/neovim"},
    {"kepano/flexoki-neovim"},

	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- { "j-hui/fidget.nvim", opts = {} },
			"saghen/blink.cmp",
			-- "folke/lazydev.nvim",
		},
	},

	-- Useful plugin to show you pending keybinds.
	{ "folke/which-key.nvim" },

	-- Adds git related signs to the gutter, as well as utilities for managing changes
	{ "lewis6991/gitsigns.nvim" },

    -- colorscheme
	{ "navarasu/onedark.nvim", priority = 1000 },

	{ "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },

	{
		"nvim-telescope/telescope.nvim",
		-- branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
		},
	},

	{ "nvim-treesitter/nvim-treesitter-textobjects", branch = 'main' },

	-- For sticky intellisense at the top for scope operations
	{ "nvim-treesitter/nvim-treesitter-context" },

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

    -- netrw icons
	{
		"prichrd/netrw.nvim",
		opts = {},
	},

    -- A conglomerate
	{ "echasnovski/mini.nvim", version = false },

    -- A conglomerate
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = true,
        -- opts = {
        --     -- On's
        --     dim = { enabled = true },
        --     -- Off's
        --     bigfile = { enabled = false },
        --     dashboard = { enabled = false },
        --     explorer = { enabled = false },
        --     indent = { enabled = false },
        --     input = { enabled = false },
        --     picker = { enabled = false },
        --     notifier = { enabled = false },
        --     quickfile = { enabled = false },
        --     scope = { enabled = false },
        --     scroll = { enabled = false },
        --     statuscolumn = { enabled = false },
        --     words = { enabled = false },
        -- },
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

    -- This section is for the plugins I like but have not tried

    -- Html tag completion
    {
        'windwp/nvim-ts-autotag',
    },

    -- Navigate functions and scopes
    {
        'stevearc/aerial.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    },

    --Pwetty
    -- {
    --     'rcarriga/nvim-notify',
    --     opts = {},
    -- },

    -- lazy.nvim
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = {},
    },

    -- Never start from blank kinda invalidates snack screen
    -- {
    --     "folke/persistence.nvim",
    --     event = "BufReadPre", -- this will only start session saving when an actual file was opened
    --     opts = {
    --         -- add any custom options here
    --     }
    -- },

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

},
    {
        ui = {
            icons = vim.g.have_nerd_font and {} or {
                cmd = "⌘",
                config = "🛠",
                event = "📅",
                ft = "📂",
                init = "⚙",
                keys = "🗝",
                plugin = "🔌",
                runtime = "💻",
                require = "🌙",
                source = "📄",
                start = "🚀",
                task = "📌",
                lazy = "💤 ",
            },
        },
    }
)

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

require("Config.Onedark")
require('colorizer').setup()
