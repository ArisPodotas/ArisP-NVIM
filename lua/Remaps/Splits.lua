vim.keymap.set("n", "<C-w>c", ":wincmd H<CR>", { desc = 'Will make the [W]indow from horizontal to vertical' })
vim.keymap.set("n", "<C-w>e", ":wincmd K<CR>", { desc = 'Will make the [W]indow from vertical to horizontal' })

-- Vertical section
vim.keymap.set("n", "<leader>ii", function()
  vim.cmd.vs()
end, { desc = 'Opens vert[I]cal split' })

vim.keymap.set("n", "<leader>it", function()
  vim.cmd.vs()
  vim.cmd.terminal("powershell")
end, { desc = 'Opens [T]erminal in a [V]ertical split' })

vim.keymap.set("n", "<leader>iu", function()
  vim.cmd.vs()
  vim.cmd.terminal("ubuntu")
end, { desc = 'Opens [U]buntu in a [V]ertical split' })

-- Under section
vim.keymap.set("n", "<leader>uu", function()
  vim.cmd.sp()
end, { desc = 'Opens [S]plit' })

vim.keymap.set("n", "<leader>ut", function()
  vim.cmd.sp()
  vim.cmd.terminal("powershell")
end, { desc = 'Opens [T]erminal [S]plit' })

vim.keymap.set("n", "<leader>ub", function()
  vim.cmd.sp()
  vim.cmd.terminal("ubuntu")
end, { desc = 'Opens u[B]untu [S]plit' })

vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = 'Go to Left split in view' })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = 'Go to Right split in view' })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = 'Go to Top split in view' })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = 'Go to Bottom split in view' })
vim.keymap.set("n", "+", "<C-w>3>", { desc = 'Increase width of split by 3' })
vim.keymap.set("n", "-", "<C-w>3<", { desc = 'Decrease width of split by 3' })

