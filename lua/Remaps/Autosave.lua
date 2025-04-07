-- Autosave
-- These should be at the top
vim.keymap.set("i", "<Esc>", '<Esc>:w<CR>', { desc = 'Autosaves on [E]xit' })
vim.keymap.set("n", "x", 'x:w<CR>', { desc = 'Autosaves on [X]' })
vim.keymap.set("n", "u", 'u:w<CR>', { desc = 'Autosaves on [U]ndo' })
vim.keymap.set("n", "<C-r>", '<C-r>:w<CR>', { desc = 'Autosaves on [R]edo' })
vim.keymap.set("n", "p", 'p:w<CR>', { desc = 'Autosaves on [P]aste' })
vim.keymap.set("n", "dd", 'dd:w<CR>', { desc = 'Autosaves on [D]elete' })
vim.keymap.set("v", "d", 'd:w<CR>', { desc = 'Autosaves on [D]elete' })

