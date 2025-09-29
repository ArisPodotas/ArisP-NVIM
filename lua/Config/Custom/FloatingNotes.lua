-- Somehow this can attach to the same file
local state = {
    floating = {
        buf = -1,
        win = -1,
    },
}

local function generateFloatingWindow(options)
    local width = options.width or math.floor(vim.o.columns * 0.8)
    local height = options.height or math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    local opts = {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    }

    local buf = nil
    if vim.api.nvim_buf_is_valid(options.buf) then
        buf = options.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    -- Open the floating window
    local win = vim.api.nvim_open_win(buf, true, opts)

    return { buf = buf, win = win }
end

local function toggleWin()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = generateFloatingWindow({buf = state.floating.buf})
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
end

vim.api.nvim_create_user_command('Notes', toggleWin, {})

vim.keymap.set('n', '<leader>nf', toggleWin, {desc = 'Open a [F]loating window'})

