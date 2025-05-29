-- change the color of the currently selected item in the completion list
vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "#98c379", fg = "#020202" , force = true, blend = 90, sp = '#ffffff'})

-- This will make sense later
local provide = {
    snippets = {
        name = 'Snippet',
        score_offset = 6,
        -- max_items = 5,
    },
    lsp = {
        name = 'LSP',
        score_offset = 0,
    },
    path = {
        name = 'Path',
        score_offset = 4,
    },
    buffer = {
        name = 'Buffer',
        score_offset = 3,
    },
    lazydev = {
        name = 'Lazy',
        module = 'lazydev.integrations.blink',
        score_offset = 100
    },
}

local maps = {
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
}

require('blink.cmp').setup(
    {
        keymap = maps,
        appearance = {
            nerd_font_variant = 'mono'
        },
        completion = {
            list = {
                selection = {
                    preselect = true,
                    auto_insert = false,
                },
            },
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
            ghost_text = { enabled = false, },
        },
        snippets = { preset = 'luasnip' },
        fuzzy = { implementation = 'prefer_rust_with_warning' },
        signature = {
            enabled = true,
            window = {
                border = "single",
                scrollbar = false,
                max_height = 35,
            },
        },
        sources = {
            default = {
                'lsp',
                'path',
                'snippets',
                'buffer'
            },
            providers = provide,
        },

        term = {
            enabled = true,
            keymap = maps,
            completion = {
                trigger = {
                    show_on_blocked_trigger_characters = {},
                    show_on_x_blocked_trigger_characters = nil,
                },
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = false,
                    },
                },
                menu = { auto_show = true },
                ghost_text = { enabled = false }
            }
        },
        cmdline = {
            enabled = true,
            keymap = maps,
            completion = {
                trigger = {
                    show_on_blocked_trigger_characters = {},
                    show_on_x_blocked_trigger_characters = nil,
                },
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = false,
                    },
                },
                menu = { auto_show = true },
                ghost_text = { enabled = false }
            },
        },
    }
)

