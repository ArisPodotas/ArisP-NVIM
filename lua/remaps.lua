-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- This is like my first own lua function
-- These functions are used in the command remaps section
local function powershell()
  vim.cmd.tabnew()
  vim.fn.termopen("powershell")
end

local function termsplith()
  vim.cmd.split()
  vim.cmd.terminal("powershell")
end

local function termsplitv()
  vim.cmd.vs()
  vim.cmd.terminal("powershell")
end

local function direct()
  vim.cmd.cd("%")
end

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Visual line mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move highlghted lines down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move highlghted lines up' })

-- Remapping page jumps to center screen
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Center screen after half page jump' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Center screen after half page jump' })
vim.keymap.set("n", "{", "{zz", { desc = 'Center screen after code block jump' })
vim.keymap.set("n", "}", "}zz", { desc = 'Center screen after code block jump' })
vim.keymap.set("n", "n", "nzzzv", { desc = 'Center screen after [n]ext jump' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'Center screen after [N]ext jump' })

-- Splits remaps

-- Remapping replacing in file
vim.keymap.set("n", "<leader>R", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>", { desc = 'find and [R]eplace {x} under cursor' })
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = '[P]aste over highlighted without replacing buffer' })

-- Command remaps
vim.keymap.set("n", "<leader>x", vim.cmd.Ex, { desc = 'Return to [Ex]plorer' })
vim.keymap.set("n", "<leader>T", vim.cmd.tabnew, { desc = 'Opens a new vim [T]ab' })
vim.keymap.set("n", "<leader>tt", powershell, { desc = 'Opens the powershell [T]erminal in a new tab' })
vim.keymap.set("n", "<leader>i", termsplitv, { desc = 'Opens Terminal in a vert[I]cal split' })
vim.keymap.set("n", "<leader>u", termsplith, { desc = 'Opens Terminal [U]nder split' })
vim.keymap.set("n", "<leader>o", direct, { desc = 'Changes direct[O]ry to current view' })

-- Tree sitter parser
vim.keymap.set("n", "<leader>`", vim.cmd.InspectTree, { desc = "Tree sitter parser pane" })

