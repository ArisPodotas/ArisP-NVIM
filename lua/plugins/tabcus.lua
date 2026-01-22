-- Simple custom tabline: tab number + buffer name (filename only)
function _G.SimpleTabLine()
    local tabline = ""
    local total_tabs = vim.fn.tabpagenr('$')
    for i = 1, total_tabs do
        local is_current = (i == vim.fn.tabpagenr())
        -- Highlight group
        tabline = tabline .. (is_current and "%#TabLineSel#" or "%#TabLine#")
        -- Tab page number (makes it clickable)
        tabline = tabline .. "%" .. i .. "T"
        -- Tab number
        tabline = tabline .. " " .. i .. " "
        -- Buffer name (filename only)
        local buflist = vim.fn.tabpagebuflist(i)
        local winnr = vim.fn.tabpagewinnr(i)
        local bufname = vim.fn.bufname(buflist[winnr])
        local label
        if bufname == "" then
        label = "[No Name]"
        else
        label = vim.fn.fnamemodify(bufname, ":t")
        end
        tabline = tabline .. label .. "  "
    end
    -- Fill the rest of the line
    tabline = tabline .. "%#TabLineFill#%T"
    return tabline
end

-- Enable the tabline
-- vim.opt.showtabline = 2          -- always show tabline
vim.opt.tabline = "%!v:lua.SimpleTabLine()"
