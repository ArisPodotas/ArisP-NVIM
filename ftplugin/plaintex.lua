vim.cmd("set filetype=tex")

vim.opt_local.spell = true

-- Spelling

vim.keymap.set('n', 'zz', 'z=1', {desc = 'Fix spelling', buffer = true})
vim.keymap.set('n', '<C-j>', ']s', {desc = 'Goto next spelling error', buffer = true}) -- Originally change line
vim.keymap.set('n', '<C-k>', '[s', {desc = 'Goto prev spelling error', buffer = true}) -- originally change line

