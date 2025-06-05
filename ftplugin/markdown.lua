
vim.opt_local.spell = true

vim.keymap.set('n', 'zz', 'z=1', {desc = 'Fix spelling'})
vim.keymap.set('n', 'gS', ']s', {desc = 'Goto prev spelling error'})
vim.keymap.set('n', '<C-s>', '[s', {desc = 'Goto next spelling error'})

