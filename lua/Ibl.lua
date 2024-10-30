--   vim.api.nvim_set_hl(0, "Whiteness", { fg = "#393939" })

require("ibl").setup({
  indent = { char = "│", tab_char = '│'},
  -- whitespace = { remove_blankline_trail = true },
  -- scope = { enabled = true, highlight = { "CursorColumn", "Whitespace" } }
})

