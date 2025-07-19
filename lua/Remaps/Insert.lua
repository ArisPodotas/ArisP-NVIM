
-- Paste clipboard in insert mode
vim.keymap.set("i", "<C-v>", "<C-c>p", { desc = 'pastest clipboard in insert mode' })

vim.keymap.set('i', '<C-j>', '<C-o>j', { desc = 'Moves the cursor down one line'})
vim.keymap.set('i', '<C-k>', '<C-o>k', { desc = 'Moves the cursor up one line'})
vim.keymap.set('i', '<C-l>', '<C-o>l', { desc = 'Moves the cursor left one space'})
vim.keymap.set('i', '<C-h>', '<C-o>h', { desc = 'Moves the cursor right one space'})
vim.keymap.set('i', '<C-w>', '<C-o>w', { desc = 'Moves the cursor one word'})
vim.keymap.set('i', '<C-b>', '<C-o>b', { desc = 'Moves the cursor back one word'})

vim.keymap.set('i', '<C-u>', '<C-o>u', { desc = '[U]ndoes the last change'})
vim.keymap.set('i', '<C-r>', '<C-o><C-r>', { desc = '[R]edoes last change'})

vim.keymap.set('i', '<A-w>', '<C-o>dw', { desc = 'deletes one word'})
vim.keymap.set('i', '<A-b>', '<C-o>db', { desc = 'deletes one word backwards'})
vim.keymap.set('i', '<A-i>', '<C-o>diw', { desc = 'deletes word you are inside of'})

vim.keymap.set('i', '<A-y>', '<C-o>y', { desc = 'Engages [Y]anks mode'})
vim.keymap.set('i', '<A-y><A-y>', '<C-o>yy', { desc = '[Y]anks current line'})

vim.keymap.set('i', '<A-d>', '<C-o>d', { desc = 'Engages [D]elete mode'})
vim.keymap.set('i', '<A-d><A-d>', '<C-o>dd', { desc = '[D]elete current line'})

vim.keymap.set('i', '<A-v>', '<C-o>v', { desc = 'Engages [V]isual mode'})
vim.keymap.set('i', '<A-v><A-v>', '<C-o>V', { desc = 'Engages [V]isual line mode'})

