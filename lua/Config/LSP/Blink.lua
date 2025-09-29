-- change the color of the currently selected item in the completion list
vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "#98c379", fg = "#020202" , force = true, blend = 90, sp = '#ffffff'})

-- This will make sense later
local provide = {
    snippets = {
        name = 'Snippet',
        score_offset = 2,
        -- max_items = 3,
    },
    lsp = {
        name = 'LSP',
        -- score_offset = 30,
        -- max_items = 5,
    },
    path = {
        name = 'Path',
        -- score_offset = 80,
        -- max_items = 5,
    },
    buffer = {
        name = 'Buffer',
        score_offset = -2,
        max_items = 5,
    },
    -- lazydev = {
    --     name = 'Lazy',
    --     module = 'lazydev.integrations.blink',
    --     -- score_offset = 20,
    --     -- max_items = 10,
    -- },
    -- avante = {
    --     module = 'blink-cmp-avante',
    --     name = 'Avante',
    --     score_offset = 5,
    --     opts = {
    --         -- add avante here
    --         avante = {
    --             command = {
    --                 get_kind_name = function(_)
    --                     return "AvanteCmd"
    --                 end,
    --             },
    --             mention = {
    --                 get_kind_name = function(_)
    --                     return "AvanteMention"
    --                 end,
    --             },
    --         },
    --         kind_icons = {
    --             AvanteCmd = '',
    --             AvanteMention = '',
    --         },
    --     },
    -- },
}

local maps = {
    ['<C-e>'] = { 'show', 'show_documentation', 'hide', 'hide_documentation', 'fallback' },
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
            keyword = {range = 'full'},
            list = {
                max_items = 100,
                selection = {
                    preselect = true,
                    auto_insert = false,
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 100,
                window = {
                    border = "single",
                    max_width = 500,
                    max_height = 18,
                },
            },
            menu = {
                border = 'rounded',
                draw = {
                    treesitter = { 'lsp' },
                    padding = { 1, 1 },
                    components = {
                        item_idx = {
                            text = function(ctx) return ctx.idx == 10 and '0' or ctx.idx >= 10 and tostring(ctx.idx) or tostring(ctx.idx) end,
                        },
                        kind_icon = {
                            text = function(ctx)
                                local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind) .. '  '
                                return kind_icon
                            end,
                            highlight = function(ctx)
                                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                                return hl
                            end,
                        },
                        kind = {
                            highlight = function(ctx)
                                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                                return hl
                            end,
                        },
                        label = {
                            width = { fill = true, max = 25},
                            text = function(ctx) return ctx.label .. ctx.label_detail end,
                            highlight = function(ctx)
                                local highlights = {
                                    { 0, #ctx.label, group = ctx.deprecated and 'BlinkCmpLabelDeprecated' or 'BlinkCmpLabel' },
                                }
                                if ctx.label_detail then
                                    table.insert(highlights, { #ctx.label, #ctx.label + #ctx.label_detail, group = 'BlinkCmpLabelDetail' })
                                end
                                for _, idx in ipairs(ctx.label_matched_indices) do
                                    table.insert(highlights, { idx, idx + 1, group = 'BlinkCmpLabelMatch' })
                                end
                                return highlights
                            end,
                        },
                        label_description = {
                            width = { max = 15, fill = true},
                            text = function(ctx) return ctx.label_description end,
                            highlight = 'BlinkCmpLabelDescription',
                        },
                    },
                    columns = {
                        {
                            'item_idx',
                        },
                        {
                            "label", "label_description", gap = 1
                        },
                        {
                            "kind_icon", "kind"
                        },
                    },
                },
            },
            ghost_text = {
                enabled = true,
                -- Show the ghost text when an item has been selected
                show_with_selection = true,
                -- Show the ghost text when no item has been selected, defaulting to the first item
                show_without_selection = true,
                -- Show the ghost text when the menu is open
                show_with_menu = false,
                -- Show the ghost text when the menu is closed
                show_without_menu = true,
            },
        },
        snippets = { preset = 'luasnip' },
        fuzzy = {
            implementation = 'prefer_rust_with_warning',
            -- max_items = 100,
        },
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
                -- 'avante',
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
                ghost_text = { enabled = true },
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
                ghost_text = { enabled = true },
            },
        },
    }
)

