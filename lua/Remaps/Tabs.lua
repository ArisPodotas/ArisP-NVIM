vim.keymap.set("n", "<leader>T", vim.cmd.tabnew, { desc = 'Opens a new vim [T]ab' })
vim.keymap.set("n", "<A-t>", ":tabn<CR>", { desc = 'Will change [T]ab' })

vim.keymap.set("n", "<leader>tt", function()
  vim.cmd.tabnew()
  vim.fn.termopen("powershell")
end, { desc = 'Opens the powershell [T]erminal in a new tab' })

vim.keymap.set("n", "<leader>tu", function()
  vim.cmd.tabnew()
  vim.fn.termopen("ubuntu")
end, { desc = 'Opens the [U]buntu [T]erminal in a new tab' })

