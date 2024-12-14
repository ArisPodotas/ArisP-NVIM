-- Setup which-key options
local which = require('which-key')

which.setup(
    {
        opts = { triggers = { { "<auto>", mode = "nxso" }, {"<A>", mode = "nxso"} } }, -- Alt still wont work but at leas now the other binds are not broken
        plugins = {
            spelling = {
                enabled = true, -- Enable spelling suggestions
            },
            marks = true,
            registers = true,
        },
        layout = {
            height = { min = 5, max = 10 }, -- Min and max number of rows
            width = { min = 12, max = 30}, -- Min and max number of columns
            spacing = 3, -- Spacing between columns
            align = "center", -- Align columns left, center, or right
        },
        -- Keybinding timeout settings
        timeoutlen = 300, -- Time to wait for a key sequence (in ms)
        preset = 'modern',
        win = {
            -- don't allow the popup to overlap with the cursor
            no_overlap = true,
            -- width = 1,
            -- height = { min = 4, max = 25 },
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
            {'<leader>b', desc = 'Buffer'},
            {'<leader>f', desc = 'Find'},
            {'<leader>d', desc = 'Document, Diagnostics'},
            {'<leader>g', desc = 'Git'},
            {'<leader>gr', desc = 'Git Remote'},
            {'<leader>gp', desc = 'Git Pull, Push'},
            {'<leader>h', desc = 'Git Hunk'},
            {'<leader>r', desc = 'Rename'},
            {'<leader>s', desc = 'Search'},
            {'<leader>t', desc = 'Terminal'},
            {'<leader>w', desc = 'Workspace'},
            {'<leader>i', desc = 'Vertical splIts'},
            {'<leader>u', desc = 'Horizontal splits'},
            {'<leader>j', desc = 'Swap Next'},
            {'<leader>k', desc = 'Swap Previous'},
            {'gj', desc = 'Go to Next Start'},
            {'gJ', desc = 'Go to Next End'},
            {'gk', desc = 'Go to Previous Start'},
            {'gK', desc = 'Go to Previous End'},
            {'ZZ', desc = 'Saves and quits'},
            -- add viel,r
            {'ZZ', desc = 'Saves and quits'},
            {'<A-t>', desc = 'Alternate tab'},
            {'<A-1>', desc = 'First harpoon listing item'},
            -- register which-key VISUAL mode
            -- required for visual <leader>hs (hunk stage) to work
            {'<leader>h', desc = 'Git [H]unk' },
            {'g', desc = 'Go to'},
        }, { mode = 'v' },
    }
)

