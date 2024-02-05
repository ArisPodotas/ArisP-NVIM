-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Make line numbers relative default $$$$----
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Aris Settin custom setups

-- Attemtpting to turn on line wrap on my own
vim.opt.wrap = false

-- Never have less than 12 lines above or below cursor
vim.opt.scrolloff = 12

-- Tabs indent at 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.list = true
vim.opt.listchars = { eol = '↲' }

-- Something about line number printing position
vim.opt.nu = true

-- Making the cursor to take any positon on the screen instead of just text like the terminal
vim.opt.virtualedit = "all"

-- Relative line numbers
vim.opt.relativenumber = true

-- Update me
vim.opt.updatetime = 50

-- Highlight searched word for the whole file after search input
vim.opt.hlsearch = true

-- Highlight searched ccontents incrumentally while typing into the register
vim.opt.incsearch = true

-- File manager sorts files by type
vim.g.netrw_sort_by = "extention"

-- Vertical splits happen to the right of nvim
vim.opt.splitright = true

-- Horizontal splits appear on the bottom
vim.opt.splitbelow = true

