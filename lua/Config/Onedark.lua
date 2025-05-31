require('onedark').setup(
    {
        transparent = true,
        style = 'deep',
        -- toggle theme style ---
        toggle_style_key = '<A-c>', -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
        toggle_style_list = {
            'dark',
            'darker',
            'cool',
            'deep',
            'warm',
            'warmer',
            'light'
        }, -- List of styles to toggle between
        -- Change code style ---
        -- Options are italic, bold, underline, none
        -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
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
            ['@comment'] = {
                fg = '#848484'
            },
            ['@lsp.type.comment'] = {
                fg = '#819696'
            },
            -- Cursor = {fmt = "reverse"},
            -- vCursor = {fmt = "reverse"},
            -- iCursor = {fmt = "reverse"},
            -- lCursor = {fmt = "reverse"},
            -- CursorIM = {fmt = "reverse"},
            -- CursorLine = {bg = '#555555'},
            -- ColorColumn = {bg = '#555555'},
            -- CursorLineNr = {fg = '#555555'},
        },
        diagnostics = {
            darker = true,
            undercurl = true,
            background = false,
        },
    }
)

require('onedark').load()

-- Just line numbers
-- vim.cmd [[
--   highlight LineNr guifg=#848484 gui=italic
--   highlight LineNrAbove guifg=#848484 gui=italic
--   highlight LineNrBelow guifg=#848484 gui=italic
--   highlight CursorLineNr guifg=#eeeeee gui=bold,italic
-- ]]

-- The cursor
-- Set cursor color
-- vim.api.nvim_set_hl(0, "Cursor", { fg = "#020202", bg = "#87b268", blend = 30})
--
-- -- Optionally set cursorline background (if cursorline is enabled)
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#659056", blend = 70 })

