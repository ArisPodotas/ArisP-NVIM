-- You use the cool pallet for 99% of the time
local onedark = require('onedark')

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
        },
        highlights = {
            CurSearch = {
                fg = '#ffffff',
                bg = '#7a05ff',
                fmt = 'underline,italic'
            },
            IncSearch = {
                fg = '#ffffff',
                bg = '#9c06c9',
                fmt = 'underline,italic'
            },
            Visual = {
                bg = '#555555',
                fmt = 'underline,bold,italic'
            },
            Search = {
                fg = '#ffffff',
                bg = '#9c06c9',
                fmt = 'underline,italic'
            },
            SpellBad = {
                bg = '#353535',
            },
            ["@lsp.type.namespace"] = {
                fg = '#93a4c3',
                fmt = 'bold,italic'
            },
            WinSeparator = {fg =  "#25747d" }
        },
        diagnostics = {
            darker = true,
            undercurl = false,
            background = false,
        },
    }
)

onedark.load()
