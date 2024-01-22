-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Aris Starting with my own keymaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move highlghted lines down' })
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv", { desc = 'Move highlghted lines up' })

-- Remapping page jumps to center screen
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Center screen after half page jump' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Center screen after half page jump' })
vim.keymap.set("n", "{", "{zz", { desc = 'Center screen after code block jump' })
vim.keymap.set("n", "}", "}zz", { desc = 'Center screen after code block jump' })
vim.keymap.set("n", "n", "nzzzv", { desc = 'Center screen after [n]ext jump' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'Center screen after [N]ext jump' })

-- Paste over highlited without replacing buffer
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = '[P]aste over highlighted without replacing buffer' })
vim.keymap.set("n", "<leader>x", vim.cmd.Ex, { desc = 'Return to [Ex]plorer' })
vim.keymap.set("n", "<leader>T", vim.cmd.tabnew, { desc = 'Opens a new vim [T]ab' })
vim.keymap.set("n", "<leader>tt", vim.cmd.terminal, { desc = 'Opens the [T]erminal' })

-- Find and replace instances of word under cursor file wide
vim.keymap.set("n", "<leader>R", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>", { desc = 'find and [R]eplace {x} under cursor' })

-- Tree sitter parser window
vim.keymap.set("n", "<leader>`", vim.cmd.InspectTree, { desc = "Tree sitter parser pane" })

