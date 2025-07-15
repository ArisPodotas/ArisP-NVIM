local colorPalette = {
    black = "#151820",
    bg0 = "#242b38",
    bg1 = "#2d3343",
    bg2 = "#343e4f",
    bg3 = "#363c51",
    bg_d = "#1e242e",
    bg_blue = "#6db9f7",
    bg_yellow = "#f0d197",
    fg = "#a5b0c5",
    purple = "#ca72e4",
    green = "#97ca72",
    orange = "#d99a5e",
    blue = "#5ab0f6",
    yellow = "#ebc275",
    cyan = "#4dbdcb",
    red = "#ef5f6b",
    grey = "#546178",
    light_grey = "#7d899f",
    dark_cyan = "#25747d",
    dark_red = "#a13131",
    dark_yellow = "#9a6b16",
    dark_purple = "#8f36a9",
    diff_add = "#303d27",
    diff_delete = "#3c2729",
    diff_change = "#18344c",
    diff_text = "#265478",
}

-- You use the cool pallet for 99% of the time
local onedark = require('onedark')

onedark.setup(
    {
        transparent = true,
        style = 'deep',
        toggle_style_key = '<A-c>',
        toggle_style_list = {
            'dark',
            'darker',
            'cool',
            'deep',
            'warm',
            'warmer',
            'light'
        },
        -- Change code style ---
        -- Options are italic, bold, underline, none
        code_style = {
            comments = 'italic',
            keywords = 'bold,italic',
            functions = 'bold,underline',
            strings = 'none',
            variables = 'none'
        },
        -- Lualine options --
        lualine = {
            transparent = true, -- lualine center bar transparency
        },
        -- -- Custom Highlights --
        colors = {
        },
        highlights = {
            CurSearch = {
                fg = '#ffffff',
                bg = '#7a05ff',
                fmt = 'underline,italic'
            },
            IncSearch = {
                fg = '#ffffff',
                bg = '#9c06c9',
                fmt = 'underline,italic'
            },
            Visual = {
                bg = '#555555',
                fmt = 'underline,bold,italic'
            },
            Search = { 
                fg = '#ffffff',
                bg = '#9c06c9',
                fmt = 'underline,italic'
            },
            SpellBad = {
                bg = '#353535',
            },
            ["@lsp.type.namespace"] = {
                fg = '#93a4c3',
                fmt = 'bold,italic'
            },
        },
        diagnostics = {
            darker = true,
            undercurl = false,
            background = true,
        },
    }
)

onedark.load()

-- Customize semantic token highlights
vim.api.nvim_set_hl(0, '@lsp.type.variable.python', {})
vim.api.nvim_set_hl(0, '@lsp.type.class.python', {})

-- Just line numbers
-- vim.cmd [[
--   highlight LineNr guifg=#848484 gui=italic
--   highlight LineNrAbove guifg=#848484 gui=italic
--   highlight LineNrBelow guifg=#848484 gui=italic
--   highlight CursorLineNr guifg=#eeeeee gui=bold,italic
-- ]]

-- The cursor
-- Set cursor color
vim.api.nvim_set_hl(0, "Cursor", {  bg = colorPalette.red })
-- vim.api.nvim_set_hl(0, "TermCursor", { bg = colorPalette.red})
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#659056", blend = 70 })

 -- Override the default hover handler to customize the popup
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = "rounded"
    opts.title = ' Docs '
    vim.api.nvim_set_hl(0, "NormalFloat", {})
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = colorPalette.red })
    -- Call the original function with modified options
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

