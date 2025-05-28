local map = require('mini.map')
map.setup(
    {
        -- Highlight integrations (none by default)
        integrations = {
            map.gen_integration.builtin_search(),
            map.gen_integration.diff(),
            map.gen_integration.diagnostic(),
        },
        -- Symbols used to display data
        symbols = {
            -- Encode symbols. See `:h MiniMap.config` for specification and
            -- `:h MiniMap.gen_encode_symbols` for pre-built ones.
            -- Default: solid blocks with 3x2 resolution.
            encode = map.gen_encode_symbols.dot('4x2'),
            -- Scrollbar parts for view and line. Use empty string to disable any.
            scroll_line = '█',
            scroll_view = '┃',
        },
        -- Window options
        window = {
            -- Whether window is focusable in normal way (with `wincmd` or mouse)
            focusable = true,
            -- Side to stick ('left' or 'right')
            side = 'right',
            -- Whether to show count of multiple integration highlights
            show_integration_count = true,
            -- Total width
            width = 10,
            -- Value of 'winblend' option
            winblend = 60,
            -- Z-index
            zindex = 10,
        },
    }
)

-- I commented these because I dont want to waste keybinds considering the other two are toggles
-- Should do this for the debugger too
-- vim.keymap.set('n', '<leader>mo', function() map.open({}) end, { desc = '[O]pens the [M]ini [M]ap' })
-- vim.keymap.set('n', '<leader>mc', function() map.close({}) end, { desc = '[C]loses the [M]ini [M]ap' })
vim.keymap.set('n', '<leader>mt', function() map.toggle({}) end, { desc = '[T]oggles the [M]ini [M]ap' })
vim.keymap.set('n', '<leader>mf', function() map.toggle_focus({}) end, { desc = '[F]ocuses the [M]ini [M]ap' })

