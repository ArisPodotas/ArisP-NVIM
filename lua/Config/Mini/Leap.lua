require('mini.jump2d').setup(
    {
        -- Function producing jump spots (byte indexed) for a particular line.
        -- For more information see |MiniJump2d.start|.
        -- If `nil` (default) - use |MiniJump2d.default_spotter|
        spotter = nil,
        -- Characters used for labels of jump spots (in supplied order)
        labels = 'abcdhiopqrefgjklmns;tuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ',
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

