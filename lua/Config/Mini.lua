require("netrw").setup({use_devicons = true})

-- require('mini.ai').setup({
--    mappings = {
--     -- Main textobject prefixes
--     around = 'a',
--     inside = 'i',
--
--     -- Next/last variants
--     around_next = 'aN',
--     inside_next = 'iN',
--     around_last = 'aL',
--     inside_last = 'iL',
--
--     -- Move cursor to corresponding edge of `a` textobject
--     goto_left = 'g[',
--     goto_right = 'g]',
--   },
-- })

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

-- require('mini.surround').setup()

