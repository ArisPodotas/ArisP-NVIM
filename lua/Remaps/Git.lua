--Git
vim.keymap.set("n", '<leader>gc', ":Git commit<CR>", { desc = '[C]ommit changes' })
vim.keymap.set("n", '<leader>gl', ":Git log<CR>", { desc = 'Git [L]og' })
vim.keymap.set("n", '<leader>gt', ":Git log --graph --pretty=format:'%h -%d %s (%cr) <%an>' --abbrev-commit --date=relative --all<CR>", { desc = 'Git [L]og [T]ree Full' })
vim.keymap.set("n", '<leader>gs', ":Git status --ignored<CR>", { desc = 'Git [S]tatus' })
vim.keymap.set("n", '<leader>gi', ":Git init .<CR>", { desc = 'Git [I]nitialize' })
vim.keymap.set("n", '<leader>gr', ":Git remote -v<CR>", { desc = 'Git [R]emote -[V]' })
vim.keymap.set("n", '<leader>gps', ":Git push ", { desc = 'Git [P]ush' })
vim.keymap.set("n", '<leader>gpl', ":Git pull ", { desc = 'Git [P]ull' })
vim.keymap.set("n", '<leader>ga', ":Git add ", { desc = 'Git [A]dd' })
vim.keymap.set("n", '<leader>gb', ":Git branch<CR>:Git checkout ", { desc = 'Git [B]ranch' })
vim.keymap.set("n", '<leader>gd', ":Git diff --stat<CR>", { desc = 'Git [D]ifferences' })


