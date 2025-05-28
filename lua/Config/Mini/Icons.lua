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

