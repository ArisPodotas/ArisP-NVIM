-- Important I just found out that %s works because % is the current file, '<,'>s is the equivalent for only the highlight Note no %s just s.
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>')
vim.keymap.set("n", "<leader><CR>", "i<CR><C-c>", { desc = 'Adds a newline at behind the cursor' })
vim.keymap.set("n", "<BS>", "hx", { desc = 'Works like backspace' })


-- Keymaps that will most likely remain uncahnged forever
vim.keymap.set("n", "-", vim.cmd.Ex, { desc = 'Return to [Ex]plorer' })
vim.keymap.set("n", "<leader>H", ':cd ~<CR>', { desc = 'Returns to [H]ome directory' })

-- Sec Terminal
-- Terminal exit
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = 'Makes escape return to normal mode in the terminal' })

-- Makes the terminal a little more vimy
-- vim.keymap.set({"n", "v"}, ":", ":<C-f>i", { desc = 'Always opens the terminal in vim mode' })
vim.keymap.set("c", "<C-j>", "<Down>", {desc = "Prev command"})
vim.keymap.set("c", "<C-k>", "<Up>", {desc = "Next command"})
vim.keymap.set("c", "<C-h>", "<Left>", {desc = "Move left in command"})
vim.keymap.set("c", "<C-l>", "<Right>", {desc = "Move right in command"})

vim.keymap.set("n", "<leader>te", "iexit<CR>", { desc = '[E]xit [T]erminal' })
vim.keymap.set("n", "<leader>tt", function()
  vim.cmd.tabnew()
  vim.cmd.terminal()
end, { desc = 'Opens the [T]erminal in a new tab' })

-- Sec Tabs
vim.keymap.set("n", "<A-t>", function()
    vim.cmd('tab split')
    vim.cmd.Ex()
end, { desc = 'Opens a new vim [T]ab' })
vim.keymap.set("n", "<leader>to", '<Cmd>tab split<CR>', { desc = 'Opens current view in another tab' })

-- Sec Thanks prime
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move highlighted lines down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move highlighted lines up' })
vim.keymap.set("n", "<leader>rr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>", { desc = 'find and [R]eplace {x} under cursor' })
vim.keymap.set("x", "<leader>P", "\"_dP", { desc = '[P]aste over highlighted without replacing buffer' })

-- Sec Change directory
vim.keymap.set("n", "<leader>o", function()
    local filepath = vim.fn.expand("%:p:h")
    local ok, err = pcall(function()
        vim.cmd.cd(filepath)
    end)
    if not ok then
        print("Could not change directory: " .. tostring(err))
    else
        vim.cmd.pwd()
    end
end, { desc = "Changes directory to current view" })

-- Sec Remapping page jumps to center screen
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Center screen after half page jump' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Center screen after half page jump' })
vim.keymap.set("n", "{", "{zz", { desc = 'Center screen after code block jump' })
vim.keymap.set("n", "}", "}zz", { desc = 'Center screen after code block jump' })
vim.keymap.set("n", "n", "nzzzv", { desc = 'Center screen after [n]ext jump' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'Center screen after [N]ext jump' })

local kopts = { noremap = true, silent = true }

vim.keymap.set("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.keymap.set("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.keymap.set("n", "*", [[* <Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.keymap.set("n", "#", [[# <Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.keymap.set("n", "g*", [[g* <Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.keymap.set("n", "g#", [[g# <Cmd>lua require('hlslens').start()<CR>]], kopts)

-- Sec Makes me do less strokes
vim.keymap.set("n", "zj", vim.cmd.w, { desc = '[S]ave' })
vim.keymap.set("n", "zk", vim.cmd.q, { desc = '[Q]uits' })

-- Sec source file
vim.keymap.set('n', '<C-s>', ':source %<CR>', { desc = '[S]ource file' })

-- Sec Tree sitter parser
vim.keymap.set("n", "<leader>`", vim.cmd.InspectTree, { desc = "Tree sitter parser pane" })

-- Sec buffers
--
-- Simple MRU buffer history
local history = {}
local pos = 0

local function push_history(buf)
    if history[pos] == buf then return end
    -- remove if exists
    for i, b in ipairs(history) do
        if b == buf then table.remove(history, i) break end
    end
    table.insert(history, buf)
    pos = #history
end

-- track when user enters a buffer
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function(ev)
        local buf = ev.buf
        if vim.bo[buf].buflisted then
            push_history(buf)
        end
    end,
})

-- go backward in history
local function history_back()
    if pos > 1 then
        pos = pos - 1
        vim.api.nvim_set_current_buf(history[pos])
    end
end

-- go forward in history
local function history_forward()
    if pos < #history then
        pos = pos + 1
        vim.api.nvim_set_current_buf(history[pos])
    else
        error('')
    end
end

vim.keymap.set("n", "<M-p>", function()
    local ok, err = pcall(history_back)
    if not ok then
        print("Already at the start of history.")
    end
end, {desc = 'Cycle history back'})

vim.keymap.set("n", "<M-n>", function()
    local ok, err = pcall(history_forward)
    if not ok then
        print("Already at the end in history.")
    end
end, {desc = 'Cycle history forward'})

vim.keymap.set("n", "<A-o>", function()
    local ok, err = pcall(
        function()
            local holder = "Buffer history: \n"
            for i, buf in ipairs(history) do
                local other, err2 = pcall(vim.api.nvim_buf_get_name, buf)
                if not other then
                    holder = holder ..'    ' .. i .. ' Problem in this buffer\n'
                else
                    local name = err2
                    holder  = holder .. '    ' .. i .. ": " .. name .. '\n'
                end
            end
            print(holder)
        end
    )
    if not ok then
        print("Too few files to list history")
    end
end, {desc = 'Print History'})
