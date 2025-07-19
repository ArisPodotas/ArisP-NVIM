require('mini.icons').setup(
    {
        default = {
            -- Override default glyph for "file" category (reuse highlight group)
            default   = { glyph = '󰟢', hl = 'MiniIconsGrey'   },
            directory = { glyph = '󰉋', hl = 'MiniIconsAzure'  },
            extension = { glyph = '󰈔', hl = 'MiniIconsGrey'   },
            file      = { glyph = '󰈤', hl = 'MiniIconsGrey'   },
            filetype  = { glyph = '󰈔', hl = 'MiniIconsGrey'   },
            lsp       = { glyph = '󰞋', hl = 'MiniIconsRed'    },
            os        = { glyph = '󰟀', hl = 'MiniIconsPurple' },
            snippets   = { glyph = '', hl = 'MiniIconsGreen'  },
        },
        lsp = {
            snippet   = { glyph = '', hl = 'MiniIconsGreen'  },
        }
    }
)

require('mini.comment').setup(
    {
        -- Options which control module behavior
        options = {
            -- Function to compute custom 'commentstring' (optional)
            custom_commentstring = nil,
            -- Whether to ignore blank lines when commenting
            ignore_blank_line = true,
            -- Whether to ignore blank lines in actions and textobject
            start_of_line = false,
            -- Whether to force single space inner padding for comment parts
            pad_comment_parts = true,
        },
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
            -- Toggle comment (like `gcip` - comment inner paragraph) for both
            -- Normal and Visual modes
            comment = 'gc',
            -- Toggle comment on current line
            comment_line = 'gcc',
            -- Toggle comment on visual selection
            comment_visual = 'gc',
            -- Define 'comment' textobject (like `dgc` - delete whole comment block)
            -- Works also in Visual mode if mapping differs from `comment_visual`
            textobject = 'gc',
        },
        -- Hook functions to be executed at certain stage of commenting
        hooks = {
            -- Before successful commenting. Does nothing by default.
            pre = function() end,
            -- After successful commenting. Does nothing by default.
            post = function() end,
        },
    }
)

require('mini.jump2d').setup(
    {
        -- Function producing jump spots (byte indexed) for a particular line.
        -- For more information see |MiniJump2d.start|.
        -- If `nil` (default) - use |MiniJump2d.default_spotter|
        spotter = nil,
        -- Characters used for labels of jump spots (in supplied order)
        labels = 'abcdhiopqrefgjklmns;tuvwxyz1234567890',
        -- Options for visual effects
        view = {
            -- Whether to dim lines with at least one jump spot
            dim = true,
            -- How many steps ahead to show. Set to big number to show all steps.
            n_steps_ahead = 0,
        },
        -- Which lines are used for computing spots
        allowed_lines = {
            blank = false, -- Blank line (not sent to spotter even if `true`)
            cursor_before = true, -- Lines before cursor line
            cursor_at = true, -- Cursor line
            cursor_after = true, -- Lines after cursor line
            fold = true, -- Start of fold (not sent to spotter even if `true`)
        },
        -- Which windows from current tabpage are used for visible lines
        allowed_windows = {
            current = true,
            not_current = true,
        },
        -- Functions to be executed at certain events
        hooks = {
            before_start = nil, -- Before jump start
            after_jump = nil, -- After jump was actually done
        },
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
            start_jumping = '\\',
        },
        -- Whether to disable showing non-error feedback
        -- This also affects (purely informational) helper messages shown after
        -- idle time if user input is required.
        silent = true,
    }
)

-- require('mini.jump').setup(
--     {
--         -- Module mappings. Use `''` (empty string) to disable one.
--         mappings = {
--             forward = 'f',
--             backward = 'F',
--             forward_till = 't',
--             backward_till = 'T',
--             repeat_jump = ';',
--         },
--         -- Delay values (in ms) for different functionalities. Set any of them to
--         -- a very big number (like 10^7) to virtually disable.
--         delay = {
--             -- Delay between jump and highlighting all possible jumps
--             highlight = 250,
--             -- Delay between jump and automatic stop if idle (no jump is done)
--             idle_stop = 10000000,
--         },
--         -- Whether to disable showing non-error feedback
--         -- This also affects (purely informational) helper messages shown after
--         -- idle time if user input is required.
--         silent = true,
--     }
-- )

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
vim.keymap.set('n', '<leader>mo', function() map.open({}) end, { desc = '[O]pens the [M]ini [M]ap' })
vim.keymap.set('n', '<leader>mc', function() map.close({}) end, { desc = '[C]loses the [M]ini [M]ap' })
vim.keymap.set('n', '<leader>mt', function() map.toggle({}) end, { desc = '[T]oggles the [M]ini [M]ap' })
vim.keymap.set('n', '<leader>mf', function() map.toggle_focus({}) end, { desc = '[F]ocuses the [M]ini [M]ap' })

-- local state = false

-- I wanted to do the above with one bind
-- Consider it done :)
-- vim.keymap.set(
--     'n', '<leader>mo', function()
--         if state == false then
--             map.open({})
--             map.toggle_focus({})
--             state = true
--         else
--             map.close({})
--             state = false
--         end
--     end,
--     { desc = '[O]pens the [M]ini [M]ap' }
-- )

require('mini.surround').setup(
    {
        -- Add custom surroundings to be used on top of builtin ones. For more
        -- information with examples, see `:h MiniSurround.config`.
        custom_surroundings = nil,
        -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
        highlight_duration = 500,
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
            add = 'Za', -- Add surrounding in Normal and Visual modes
            delete = 'Zd', -- Delete surrounding
            find = 'Zf', -- Find surrounding (to the right)
            find_left = 'ZF', -- Find surrounding (to the left)
            highlight = 'Zh', -- Highlight surrounding
            replace = 'Zr', -- Replace surrounding
            update_n_lines = 'Zn', -- Update `n_lines`
            suffix_last = 'l', -- Suffix to search with "prev" method
            suffix_next = 'n', -- Suffix to search with "next" method
        },
        -- Number of lines within which surrounding is searched
        n_lines = 20,
        -- Whether to respect selection type:
        -- - Place surroundings on separate lines in linewise mode.
        -- - Place surroundings on each line in blockwise mode.
        respect_selection_type = false,
        -- How to search for surrounding (first inside current line, then inside
        -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
        -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
        -- see `:h MiniSurround.config`.
        search_method = 'cover',
        -- Whether to disable showing non-error feedback
        -- This also affects (purely informational) helper messages shown after
        -- idle time if user input is required.
        silent = true,
    }
)

