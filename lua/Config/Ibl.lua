local hooks = require("ibl.hooks")
local colors = require('Config.Palette')

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "Whiteness", { fg = colors.bg3 })
    vim.api.nvim_set_hl(0, "ScopeWhite", { fg = colors.reder})
end)

require("ibl").setup({
    indent = {
        char = "│",
        highlight = "Whiteness",
    },
    scope = {
        enabled = true,
        highlight = "ScopeWhite",
        show_start = true,
        show_end = true,
    },
})
