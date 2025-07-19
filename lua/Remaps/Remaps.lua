-- Important I just found out that %s works because % is the current file, '<,'>s is the equivalent for only the highlight Note no %s just s.
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Keymaps that will most likely remain uncahnged forever
-- Terminal
vim.keymap.set("n", "<leader>x", vim.cmd.Ex, { desc = 'Return to [Ex]plorer' })
vim.keymap.set("n", "<leader>H", ':cd C:/Users/aPodo/<CR>', { desc = 'Returns to [H]ome directory' })

-- Terminal exit
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = 'Makes escape return to normal mode in the terminal' })
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>", { desc = 'Makes control [ return to normal mode in the terminal' })

-- Makes the terminal a little more vimy
vim.keymap.set("n", ":", ":<C-f>i", { desc = 'Always opens the terminal in vim mode' })

vim.keymap.set("n", "<leader>te", "iexit<CR>", { desc = '[E]xit [T]erminal' })

-- Tabs
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

-- Thanks prime
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move highlighted lines down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move highlighted lines up' })

-- Change directory
vim.keymap.set("n", "<leader>o", function()
  if pcall(function()
    vim.cmd.cd("%")
    vim.cmd.cd(".")
  end) ~= 0 then vim.cmd.pwd()
  elseif vim.api.nvim_buf_get_name(0) then
    print('you identified being in the file proeperly')
  else
    vim.cmd.cd("%")
    vim.cmd.cd(".")
    vim.cmd.pwd()
  end
end, { desc = 'Changes direct[O]ry to current view' })

-- vim.keymap.set("n", "<CR>", "i<CR>", { desc = 'Adds a newline where the cursor is to write' })
vim.keymap.set("n", "<leader><CR>", "i<CR><C-c>", { desc = 'Adds a newline at behind the cursor' })

-- Remapping page jumps to center screen
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Center screen after half page jump' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Center screen after half page jump' })
vim.keymap.set("n", "{", "{zz", { desc = 'Center screen after code block jump' })
vim.keymap.set("n", "}", "}zz", { desc = 'Center screen after code block jump' })
vim.keymap.set("n", "n", "nzzzv", { desc = 'Center screen after [n]ext jump' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'Center screen after [N]ext jump' })

-- Makes me do less strokes could be removed and obv bypass the terminal (justify the placement here)
vim.keymap.set("n", "zj", vim.cmd.w, { desc = '[S]ave' })
-- vim.keymap.set("n", "zj", ":w<CR>", { desc = '[S]ave' })
-- vim.keymap.set("n", "zk", ":w<CR>q<CR>", { desc = '[Q]uits' })
vim.keymap.set("n", "zk", vim.cmd.q, { desc = '[Q]uits' })

-- source file
vim.keymap.set('n', '<C-s>', ':source %<CR>', { desc = '[S]ource file' })

-- Remapping replacing in file
vim.keymap.set("n", "<leader>rr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>", { desc = 'find and [R]eplace {x} under cursor' })
vim.keymap.set("x", "<leader>P", "\"_dP", { desc = '[P]aste over highlighted without replacing buffer' })

-- Tree sitter parser
vim.keymap.set("n", "<leader>`", vim.cmd.InspectTree, { desc = "Tree sitter parser pane" })

-- Clear highlight
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>')

-- Control section
