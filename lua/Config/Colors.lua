-- Note: There are some colors in the lualine file
local colorPalette = require('Config.Palette')

-- visual
-- vim.api.nvim_set_hl(0, "Visual", {
--     bg = colorPalette.alt_visual_bg,
--     -- fg = "#ffffff",
-- })
--
vim.api.nvim_set_hl(0, "Visual", {
    reverse = true,
})

-- How cursorhold highlights
-- for strings
vim.api.nvim_set_hl(0, "LspReferenceText", {
    bg = colorPalette.diff_add
})

-- background highlight color
vim.api.nvim_set_hl(0, "LspReferenceRead", {
    bg = colorPalette.cursorhighlight_txt,
})

-- Random fields sometimes in functions
vim.api.nvim_set_hl(0, "LspReferenceWrite", {
    bg = colorPalette.cursorhighlight_txt,
    bold = true,
})

vim.api.nvim_set_hl(0, "MatchParen", {
    fg = colorPalette.bracketmatch,
    bg = colorPalette.cursorhighlight_txt,
    bold = true,
    underline = true
})

-- Custom tabline colors
-- vim.api.nvim_set_hl(0, 'TabLine', { fg = colorPalette.bg0, bg = colorPalette.extra1})
-- vim.api.nvim_set_hl(0, 'TabLineFill',     { fg = colorPalette.bg0, bg = colorPalette.blue})
vim.api.nvim_set_hl(0, 'TabLineSel',  { fg = colorPalette.blink_fg, bg = colorPalette.green, bold = true })

-- Customize semantic token highlights
vim.api.nvim_set_hl(0, '@lsp.type.variable.python', {})
-- vim.api.nvim_set_hl(0, '@lsp.type.class.python', {})
vim.api.nvim_set_hl(0, '@spell', {}) -- Anoying ass gray color on everything
vim.api.nvim_set_hl(0, '@nospell', {}) -- Anoying ass gray color on everything
vim.api.nvim_set_hl(0, '@lsp.mod.documentation.lua', {fg = colorPalette.cyan})

-- Just line numbers
-- vim.cmd [[
--   highlight LineNr guifg=#848484 gui=italic
--   highlight LineNrAbove guifg=#848484 gui=italic
--   highlight LineNrBelow guifg=#848484 gui=italic
--   highlight CursorLineNr guifg=#eeeeee gui=bold,italic
-- ]]

-- The cursor
-- Set cursor color
-- vim.api.nvim_set_hl(0, "Cursor", { bg = colorPalette.red })
-- vim.api.nvim_set_hl(0, "TermCursor", { bg = colorPalette.red})
vim.api.nvim_set_hl(0, "CursorLine", { bg = '#000000', blend = 70 })

-- Floating windows
vim.api.nvim_set_hl(0, "NormalFloat", {})
vim.api.nvim_set_hl(0, "FloatBorder", { fg = colorPalette.red })

 -- Override the default hover handler to customize the popup
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = "rounded"
    opts.title = ' Docs '
    -- Call the original function with modified options
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Completion
vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = colorPalette.blink_bg, fg = colorPalette.blink_fg, force = true, blend = 90, sp = '#ffffff'})

-- Set custom highlight groups for Telescope borders
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = colorPalette.red, bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = colorPalette.cyan, bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = colorPalette.purple, bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = colorPalette.red, bg = "none" })

-- Highlight ghost text colors
vim.api.nvim_set_hl(0, "HlSearchLensNear", { fg = colorPalette.gooey_green, bold = true })
vim.api.nvim_set_hl(0, "HlSearchLens",     { fg = colorPalette.dark_purple})

require('colorizer').setup()
