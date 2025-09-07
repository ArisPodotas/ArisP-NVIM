-- Setup which-key options
local which = require('which-key')

which.setup(
    {
        opts = {
            triggers = {
                {
                    "<auto>",
                    mode = "nxso" 
                },
            }
        }, -- Alt still wont work but at leas now the other binds are not broken
        plugins = {
            spelling = {
                enabled = true, -- Enable spelling suggestions
            },
            marks = true,
            registers = true,
        },
        layout = {
            height = { min = 1, max = 20 }, -- Min and max number of rows
            width = { min = 12, max = 30}, -- Min and max number of columns
            spacing = 3, -- Spacing between columns
            align = "center", -- Align columns left, center, or right
        },
        keys = {
            scroll_down = '<C-d>',
            scroll_up = '<C-u>',
        },
        -- sort = 'alphanum',
        -- expand = 3, -- didnt like this
        -- Keybinding timeout settings
        timeoutlen = nil, -- Time to wait for a key sequence (in ms)
        preset = 'modern',
        win = {
            -- don't allow the popup to overlap with the cursor
            no_overlap = false,
            -- width = 1,
            height = { min = 4, max = 30 },
            -- col = 0,
            -- row = math.huge,
            -- border = "none",
            padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
            title = true,
            title_pos = "center",
            zindex = 1000,
            -- Additional vim.wo and vim.bo options
            bo = {},
            wo = {
                winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
            },
        },
    }
)

-- document existing key chains
which.add (
    {
        {
            {'<leader>c', desc = 'Code'},
            {'c', desc = 'Change'},
            {'<leader>b', desc = '[B]uffer'},
            {'<leader>f', desc = '[F]ind'},
            {'<leader>d', desc = '[D]ocument, [D]iagnostics'},
            {'<leader>g', desc = '[G]it'},
            {'<leader>gr', desc = '[G]it [R]emote'},
            {'<leader>gp', desc = '[G]it [P]ull, [P]ush'},
            {'<leader>h', desc = 'Git [H]unk'},
            {'<leader>r', desc = '[R]ename'},
            {'<leader>s', desc = '[S]earch'},
            {'<leader>t', desc = '[T]erminal'},
            {'<leader>w', desc = 'Workspace'},
            {'<leader>i', desc = 'Vertical spl[I]ts'},
            {'<leader>u', desc = 'Horizontal splits'},
            {'<leader>j', desc = 'Swap Next'},
            {'<leader>k', desc = 'Swap Previous'},
            {'gj', desc = 'Go to Next Start'},
            {'gJ', desc = 'Go to Next End'},
            {'gk', desc = 'Go to Previous Start'},
            {'gK', desc = 'Go to Previous End'},
            {'ZZ', desc = 'Saves and quits'},
            {'<leader>p', desc = 'Debug'},
            {'<leader>m', desc = 'Document Map'},
            -- register which-key VISUAL mode
            -- required for visual <leader>hs (hunk stage) to work
            {'<leader>h', desc = 'Git [H]unk' },
            {'g', desc = 'Go to'},
        }, { mode = 'v' },
    }
)

