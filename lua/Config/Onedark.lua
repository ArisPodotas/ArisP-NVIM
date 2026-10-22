-- You use the cool pallet for 99% of the time
local onedark = require('onedark')
local palette = require('Config.Palette')

onedark.setup(
    {
        transparent = true,
        style = 'deep',
        toggle_style_key = '<A-c>',
        toggle_style_list = {
            'dark',
            'darker',
            'cool',
            'deep',
            'warm',
            'warmer',
            'light'
        },
        -- Change code style ---
        -- Options are italic, bold, underline, none
        code_style = {
            comments = 'italic',
            keywords = 'bold,italic',
            functions = 'bold,underline',
            strings = 'none',
            variables = 'none'
        },
        -- Lualine options --
        lualine = {
            transparent = true, -- lualine center bar transparency
        },
        -- -- Custom Highlights --
        colors = {
            -- bg0  = '#12221a'
        },
        highlights = {
            -- Comment = {
            --     fg = palette.light_grey,
            --     bg = palette.bg0,
            -- },
            CurSearch = {
                fg = palette.fullwhite,
                bg = palette.cur_highlight_purple,
                fmt = 'underline,italic'
            },
            IncSearch = {
                fg = palette.fullwhite,
                bg = palette.highlight_purple,
                fmt = 'underline,italic'
            },
            Visual = {
                -- bg = palette.alt_visual_bg,
                fmt = 'underline,bold,italic'
            },
            Search = {
                fg = palette.fullwhite,
                bg = palette.highlight_purple,
                fmt = 'underline,italic'
            },
            SpellBad = {
                bg = palette.spellbad_bg,
            },
            ["@lsp.type.namespace"] = {
                fg = palette.alt_namespace,
                fmt = 'bold,italic'
            },
            WinSeparator = {fg = palette.dark_cyan }
        },
        diagnostics = {
            darker = true,
            undercurl = false,
            background = false,
        },
    }
)

onedark.load()
