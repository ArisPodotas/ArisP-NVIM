vim.keymap.set("n", "<C-w>c", ":wincmd H<CR>", { desc = 'Will make the [W]indow from horizontal to vertical' })
vim.keymap.set("n", "<C-w>e", ":wincmd K<CR>", { desc = 'Will make the [W]indow from vertical to horizontal' })

-- Vertical section
vim.keymap.set("n", "<leader>ii", function()
    vim.cmd.vs()
end, { desc = 'Opens vert[I]cal split' })

vim.keymap.set("n", "<leader>it", function()
    vim.cmd.vs()
    vim.cmd.terminal()
end, { desc = 'Opens [T]erminal in a [V]ertical split' })

-- Under section
vim.keymap.set("n", "<leader>uu", function()
    vim.cmd.sp()
end, { desc = 'Opens [S]plit' })

vim.keymap.set("n", "<leader>ut", function()
    vim.cmd.sp()
    vim.cmd.terminal()
end, { desc = 'Opens [T]erminal [S]plit' })

-- Making a way faster way of doing what the animated windows would
vim.keymap.set("n", "<A-h>", "<C-w>h<C-w>=18<C-w>>", { desc = 'Go to Left split in view' })
vim.keymap.set("n", "<A-l>", "<C-w>l<C-w>=18<C-w>>", { desc = 'Go to Right split in view' })
vim.keymap.set("n", "<A-j>", "<C-w>j<C-w>=18<C-w>>", { desc = 'Go to Top split in view' })
vim.keymap.set("n", "<A-k>", "<C-w>k<C-w>=18<C-w>>", { desc = 'Go to Bottom split in view' })
vim.keymap.set("n", "+", "<C-w>3>", { desc = 'Increase width of split by 3' })
vim.keymap.set("n", "_", "<C-w>3<", { desc = 'Decrease width of split by 3' })
