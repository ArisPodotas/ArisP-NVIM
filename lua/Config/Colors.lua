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
    intermediate_cyan = "#49a9b9",
    dark_cyan = "#25747d",
    dark_red = "#a13131",
    dark_yellow = "#9a6b16",
    dark_purple = "#8f36a9",
    diff_add = "#303d27",
    diff_delete = "#3c2729",
    diff_change = "#18344c",
    diff_text = "#265478",
    extra1 = "#5E81AC",
    dark_blue_addon = '#5f87af',
    light_red_addon =  '#faaaaa',
    blink_bg = "#98c379",
    blink_fg = "#020202",
    gooey_green = "#80ca72",
}

-- vim.api.nvim_set_hl(0, 'TabLine', { fg = colorPalette.bg0, bg = colorPalette.extra1})
-- vim.api.nvim_set_hl(0, 'TabLineFill',     { fg = colorPalette.bg0, bg = colorPalette.blue})
vim.api.nvim_set_hl(0, 'TabLineSel',  { fg = colorPalette.blink_fg, bg = colorPalette.green, bold = true })
-- Customize semantic token highlights
vim.api.nvim_set_hl(0, '@lsp.type.variable.python', {})
vim.api.nvim_set_hl(0, '@lsp.type.class.python', {})
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
-- vim.api.nvim_set_hl(0, "Cursor", {  bg = colorPalette.red })
-- vim.api.nvim_set_hl(0, "TermCursor", { bg = colorPalette.red})
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#659056", blend = 70 })

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

vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = colorPalette.blink_bg, fg = colorPalette.blink_fg, force = true, blend = 90, sp = '#ffffff'})

-- Set custom highlight groups for Telescope borders
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = colorPalette.red, bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = colorPalette.cyan, bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = colorPalette.purple, bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = colorPalette.red, bg = "none" })

require('colorizer').setup()

if vim.g.neovide then
    vim.g.neovide_fullscreen = true
    vim.g.neovide_background_color = colorPalette.bg_blue  -- Optional: Set a base color (hex code)
    -- vim.g.neovide_scroll_animation_length = 0 -- Disable animation
    vim.g.neovide_window_blurred = true  -- Enables window-level blur (Acrylic effect)
    vim.g.neovide_opacity = 0.65  -- Window opacity (0.0 fully transparent, 1.0 opaque); adjust for blur intensity
    vim.g.neovide_normal_opacity = 0.65  -- Keeps the editor content opaque while blurring the background
end

vim.api.nvim_set_hl(0, "HlSearchLensNear", { fg = colorPalette.gooey_green, bold = true })
vim.api.nvim_set_hl(0, "HlSearchLens",     { fg = colorPalette.dark_purple})
