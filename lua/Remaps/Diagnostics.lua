-- Diagnostic keymaps
vim.keymap.set('n', 'gjd', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', 'gkd', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Variable to track diagnostic visibility state
local diagnostics_active = true

function ToggleDiagnostics()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
        vim.diagnostic.enable()
    else
        vim.diagnostic.enable(false)
    end
end

vim.keymap.set('n', '<leader>dt', ':lua ToggleDiagnostics()<CR>', { desc = "[T]oggle [D]iagnostics" })

