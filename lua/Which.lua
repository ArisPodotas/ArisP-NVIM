-- Setup which-key options
require('which-key').setup({
    opts = { triggers = { { "<auto>", mode = "nxso" } } },
    plugins = {
        spelling = {
            enabled = true, -- Enable spelling suggestions
        },
    },
    -- Keybinding timeout settings
    timeoutlen = 300, -- Time to wait for a key sequence (in ms)
    window = {
        border = "rounded", -- Border style for the popup window
        position = "bottom", -- Popup window position
    },
})

-- document existing key chains
require('which-key').add ({
  {'<leader>c', desc = 'Code'},
  {'<leader>d', desc = 'Document'},
  {'<leader>g', desc = 'Git'},
  {'<leader>gr', desc = 'Git Remote'},
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
  -- {'<A-t>', desc = 'Alternate tab'},
  -- {'<A-1>', desc = 'First harpoon listing item'},
})

-- register which-key VISUAL mode
-- required for visual <leader>hs (hunk stage) to work
require('which-key').add ({
  {'<leader>', name = 'VISUAL <leader>' },
  {'<leader>h', desc = 'Git [H]unk' },
  {'g', desc = 'Go to'},
}, { mode = 'v' })

