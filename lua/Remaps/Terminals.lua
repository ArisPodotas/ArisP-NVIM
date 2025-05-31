-- Terminal exit
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = 'Makes escape return to normal mode in the terminal' })
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>", { desc = 'Makes control [ return to normal mode in the terminal' })

-- Makes the terminal a little more vimy
vim.keymap.set("n", ":", ":<C-f>i", { desc = 'Always opens the terminal in vim mode' })

vim.keymap.set("n", "<leader>te", "iexit<CR>", { desc = '[E]xit [T]erminal' })

