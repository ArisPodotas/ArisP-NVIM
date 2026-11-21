vim.api.nvim_set_hl(0, "Whiteness", { fg = "#383838" })
vim.api.nvim_set_hl(0, "ScopeWhite", { fg = "#6f6f6f" })

require("ibl").setup(
    {
        indent = { char = "│", tab_char = '│', highlight = { "Whiteness" } },
        -- whitespace = { remove_blankline_trail = true },
        scope = { enabled = true, highlight = { "ScopeWhite" } }
    }
)

-- require("ibl.hooks").register(require("ibl.hooks").type.SCOPE_HIGHLIGHT, require("ibl.hooks").builtin.scope_highlight_from_extmark)

