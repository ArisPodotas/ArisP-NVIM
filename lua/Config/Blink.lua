-- change the color of the currently selected item in the completion list
vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "#98c379", fg = "#020202" , force = true, blend = 90, sp = '#ffffff'})

require('blink.cmp').setup(
    {
        keymap = {
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation', 'fallback' },
            ['<C-e>'] = { 'hide', 'fallback' },
            ['<Tab>'] = { 'select_and_accept', 'fallback' },
            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
            ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
            ['<C-j>'] = { 'snippet_forward', 'fallback' },
            ['<C-k>'] = { 'snippet_backward', 'fallback' },
            ['<S-Tab>'] = { 'show_signature', 'hide_signature', 'fallback' },
            ['<A-1>'] = { function(cmp) cmp.accept({ index = 1 }) end , 'fallback'},
            ['<A-2>'] = { function(cmp) cmp.accept({ index = 2 }) end , 'fallback'},
            ['<A-3>'] = { function(cmp) cmp.accept({ index = 3 }) end , 'fallback'},
            ['<A-4>'] = { function(cmp) cmp.accept({ index = 4 }) end , 'fallback'},
            ['<A-5>'] = { function(cmp) cmp.accept({ index = 5 }) end , 'fallback'},
            ['<A-6>'] = { function(cmp) cmp.accept({ index = 6 }) end , 'fallback'},
            ['<A-7>'] = { function(cmp) cmp.accept({ index = 7 }) end , 'fallback'},
            ['<A-8>'] = { function(cmp) cmp.accept({ index = 8 }) end , 'fallback'},
            ['<A-9>'] = { function(cmp) cmp.accept({ index = 9 }) end , 'fallback'},
            ['<A-0>'] = { function(cmp) cmp.accept({ index = 10 }) end , 'fallback'},
        },
        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono'
        },
        completion = {
            documentation = {
                auto_show = true,
                window = {
                    border = "single",
                    max_width = 50,
                    max_height = 10,
                },
            },
            menu = {
                border = 'rounded',
                draw = {
                    treesitter = { 'lsp' },
                    padding = { 1, 1 },
                    components = {
                        kind_icon = {
                            text = function(ctx)
                                local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind) .. '  '
                                return kind_icon
                            end,
                            -- (optional) use highlights from mini.icons
                            highlight = function(ctx)
                                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                                return hl
                            end,
                        },
                        kind = {
                            -- (optional) use highlights from mini.icons
                            highlight = function(ctx)
                                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                                return hl
                            end,
                        }
                    },
                    -- cursorline_priority = 0,
                    columns = {
                        {
                            "label", "label_description", gap = 1 
                        },
                        {
                            "kind_icon", "kind" 
                        },
                    }
                },
            },
            ghost_text = {
                enabled = true,
            },
        },
        term = {
            enabled = true,
            keymap = {
                ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation', 'fallback' },
                ['<C-e>'] = { 'hide' , 'fallback'},
                ['<Tab>'] = { 'select_and_accept', 'fallback' },
                ['<Up>'] = { 'select_prev', 'fallback' },
                ['<Down>'] = { 'select_next', 'fallback' },
                ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
                ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
                ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
                ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
                ['<C-j>'] = { 'snippet_forward', 'fallback' },
                ['<C-k>'] = { 'snippet_backward', 'fallback' },
                ['<S-Tab>'] = { 'show_signature', 'hide_signature', 'fallback' },
                ['<A-1>'] = { function(cmp) cmp.accept({ index = 1 }) end , 'fallback'},
                ['<A-2>'] = { function(cmp) cmp.accept({ index = 2 }) end , 'fallback'},
                ['<A-3>'] = { function(cmp) cmp.accept({ index = 3 }) end , 'fallback'},
                ['<A-4>'] = { function(cmp) cmp.accept({ index = 4 }) end , 'fallback'},
                ['<A-5>'] = { function(cmp) cmp.accept({ index = 5 }) end , 'fallback'},
                ['<A-6>'] = { function(cmp) cmp.accept({ index = 6 }) end , 'fallback'},
                ['<A-7>'] = { function(cmp) cmp.accept({ index = 7 }) end , 'fallback'},
                ['<A-8>'] = { function(cmp) cmp.accept({ index = 8 }) end , 'fallback'},
                ['<A-9>'] = { function(cmp) cmp.accept({ index = 9 }) end , 'fallback'},
                ['<A-0>'] = { function(cmp) cmp.accept({ index = 10 }) end , 'fallback'},
            },
            sources = {
                default = {
                    'lsp',
                    'path',
                    'snippets',
                    'buffer'
                },
            },
            completion = {
                trigger = {
                    show_on_blocked_trigger_characters = {},
                    show_on_x_blocked_trigger_characters = nil, -- Inherits from top level `completion.trigger.show_on_blocked_trigger_characters` config when not set
                },
                -- Inherits from top level config options when not set
                list = {
                    selection = {
                        -- When `true`, will automatically select the first item in the completion list
                        preselect = true,
                        -- When `true`, inserts the completion item automatically when selecting it
                        auto_insert = false,
                    },
                },
                -- Whether to automatically show the window when new completion items are available
                menu = { auto_show = true },
                -- Displays a preview of the selected item on the current line
                ghost_text = { enabled = true }
            }
        },
        cmdline = {
            keymap = {
                ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation', 'fallback' },
                ['<C-e>'] = { 'hide' , 'fallback'},
                ['<Tab>'] = { 'select_and_accept', 'fallback' },
                ['<Up>'] = { 'select_prev', 'fallback' },
                ['<Down>'] = { 'select_next', 'fallback' },
                ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
                ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
                ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
                ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
                ['<C-j>'] = { 'snippet_forward', 'fallback' },
                ['<C-k>'] = { 'snippet_backward', 'fallback' },
                ['<S-Tab>'] = { 'show_signature', 'hide_signature', 'fallback' },
                ['<A-1>'] = { function(cmp) cmp.accept({ index = 1 }) end , 'fallback'},
                ['<A-2>'] = { function(cmp) cmp.accept({ index = 2 }) end , 'fallback'},
                ['<A-3>'] = { function(cmp) cmp.accept({ index = 3 }) end , 'fallback'},
                ['<A-4>'] = { function(cmp) cmp.accept({ index = 4 }) end , 'fallback'},
                ['<A-5>'] = { function(cmp) cmp.accept({ index = 5 }) end , 'fallback'},
                ['<A-6>'] = { function(cmp) cmp.accept({ index = 6 }) end , 'fallback'},
                ['<A-7>'] = { function(cmp) cmp.accept({ index = 7 }) end , 'fallback'},
                ['<A-8>'] = { function(cmp) cmp.accept({ index = 8 }) end , 'fallback'},
                ['<A-9>'] = { function(cmp) cmp.accept({ index = 9 }) end , 'fallback'},
                ['<A-0>'] = { function(cmp) cmp.accept({ index = 10 }) end , 'fallback'},
            },
            completion = {
                menu = {
                    auto_show = true
                }
            },
        },
        snippets = { preset = 'luasnip' },
        fuzzy = { implementation = 'prefer_rust_with_warning' },
        signature = {
            enabled = true,
            window = {
                border = "single", -- Matches cmp.config.window.bordered
                scrollbar = true, -- Enable scrollbar
                -- col_offset = 1, -- Column offset for the completion menu
                -- side_padding = 1, -- Padding inside the completion window
                max_height = 35, -- Equivalent to max_item_count, limits visible items
            },
        },
        sources = {
            default = {
                'lsp',
                'path',
                'snippets',
                'buffer'
            },
            providers = {
                lazydev = {
                    module = 'lazydev.integrations.blink',
                    score_offset = 100
                },
            },
        },
    }
)

