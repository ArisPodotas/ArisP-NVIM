-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info

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

require("lazy").setup({
	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	-- Detect tabstop and shiftwidth automatically
	-- 'NMAC427/guess-indent.nvim',

	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{
					path = "${3rd}/luv/library",
					words = {
						"vim%.uv",
					},
				},
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- { "j-hui/fidget.nvim", opts = {} },
			"saghen/blink.cmp",
			"folke/lazydev.nvim",
		},
	},

	-- Useful plugin to show you pending keybinds.
	{ "folke/which-key.nvim" },

	-- Adds git related signs to the gutter, as well as utilities for managing changes
	{ "lewis6991/gitsigns.nvim" },

	{ "navarasu/onedark.nvim", priority = 1000 },

	{ "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },

	-- "gc" to comment visual regions/lines
	-- { "numToStr/Comment.nvim" },

	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects", },
		build = ":TSUpdate",
	},

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

	-- didnt uninstall still here if i want to enalbe lt
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
        lazy = false,
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

	-- AI
	-- { "supermaven-inc/supermaven-nvim" },

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
		event = "VimEnter",
		version = "1.*",
		dependencies = {
            -- 'Kaiser-Yang/blink-cmp-avante',
			-- Snippet Engine
			{
				"L3MON4D3/LuaSnip",
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
			"folke/lazydev.nvim",
		},
	},

    -- Autoformat
	-- {
	--     'stevearc/conform.nvim',
	--     event = { 'BufWritePre' },
	--     cmd = { 'ConformInfo' },
	-- },

    -- {
    --     'MeanderingProgrammer/render-markdown.nvim',
    --     dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    --     -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    --     -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    --     ---@module 'render-markdown'
    --     ---@type render.md.UserConfig
    --     opts = {},
    -- },

    -- require('Config.Avant')

    -- This section is for the plugins I like but have not tried

    -- Html tag completion
    {
        'windwp/nvim-ts-autotag',
    },

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

    -- Navigate functions and scopes
    --{
        -- stevearc/aerial.nvim
    --},

    --Pwetty
    {
        'rcarriga/nvim-notify',
        opts = {},
    },

    -- {
        -- sQVe/sort.nvim
    -- },

    {
        'norcalli/nvim-colorizer.lua',
        opts = {},
    },
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
