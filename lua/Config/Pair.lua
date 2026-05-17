local npairs = require("nvim-autopairs")

npairs.setup(
    {
        enabled = function(bufnr) return true end, -- control if auto-pairs should be enabled when attaching to a buffer
        disable_filetype = { "TelescopePrompt", "spectre_panel", "snacks_picker_input" },
        disable_in_macro = true, -- disable when recording or executing a macro
        disable_in_visualblock = false, -- disable when insert after visual block mode
        disable_in_replace_mode = false,
        ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
        enable_moveright = true,
        enable_afterquote = true, -- add bracket pairs after quote
        enable_check_bracket_line = true, --- check bracket in same line
        enable_bracket_in_quote = true, --
        enable_abbr = false, -- trigger abbreviation
        break_undo = true, -- switch for basic rule break undo sequence
        check_ts = true,
        ts_config = {
            lua = {'string'},-- it will not add a pair on that treesitter node
            javascript = {'template_string'},
            java = false,-- don't check treesitter on java
        },
        map_cr = true,
        map_bs = true, -- map the <BS> key
        map_c_h = false, -- Map the <C-h> key to delete a pair
        map_c_w = false, -- map <c-w> to delete a pair if possible
    }
)

vim.keymap.set('n', '<leader>ae', function() require('nvim-autopairs').enable() end, {desc = '[A]utopairs [E]nable'})
vim.keymap.set('n', '<leader>ad', function() require('nvim-autopairs').disable() end, {desc = '[A]utopairs [D]isable'})
vim.keymap.set('n', '<leader>at', function() require('nvim-autopairs').toggle() end, {desc = '[A]utopairs [T]oggle'})

