-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
    require('nvim-treesitter.configs').setup { sync_install = true,
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = { 'c', 'cpp', 'lua', 'python', 'rust', 'vimdoc', 'vim', 'bash', 'perl', 'javascript', 'html', 'css', 'php' , 'r', 'markdown', 'latex'}, -- 'go', 'tsx', 'typescript'
        modules = {},
        ignore_install = {},

        -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { 'ruby' },
        },
        indent = {
            enable = true,
            disable = { 'ruby' }
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = 'gss',
                scope_incremental = 'gsi',
                node_incremental = 'gsn',
                node_decremental = 'gsd',
            },
            selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V', -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
            },
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                keymaps = {
                    ['iee'] = '@assignment.inner',
                    ['iel'] = '@assignment.lhs',
                    ['ae'] = '@assignment.outer',
                    ['ier'] = '@assignment.rhs',
                    ['ia'] = '@attribute.inner',
                    ['aa'] = '@attribute.outer',
                    ['ib'] = '@block.inner',
                    ['ab'] = '@block.outer',
                    ['ik'] = '@call.inner',
                    ['ak'] = '@call.outer',
                    ['io'] = '@comment.inner',
                    ['ao'] = '@comment.outer',
                    ['im'] = '@frame.inner',
                    ['am'] = '@frame.outer',
                    ['in'] = '@number.inner',
                    ['ix'] = '@regex.inner',
                    ['ax'] = '@regex.outer',
                    ['ir'] = '@return.inner',
                    ['ar'] = '@return.outer',
                    ['is'] = '@scopename.inner',
                    ['as'] = '@statement.outer',
                    ['av'] = '@parameter.outer',
                    ['iv'] = '@parameter.inner',
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                    ['ac'] = '@class.outer',
                    ['ic'] = '@class.inner',
                    ['al'] = '@loop.outer',
                    ['il'] = '@loop.inner',
                    ['ai'] = '@conditional.outer',
                    ['ii'] = '@conditional.inner',
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ['gje'] = '@assignment.outer',
                    ['gja'] = '@attribute.outer',
                    ['gjb'] = '@block.outer',
                    ['gjk'] = '@call.outer',
                    ['gjo'] = '@comment.outer',
                    ['gjm'] = '@frame.outer',
                    ['gjx'] = '@regex.outer',
                    ['gjr'] = '@return.outer',
                    ['gjs'] = '@statement.outer',
                    ['gjp'] = '@parameter.outer',
                    ['gjf'] = '@function.outer',
                    ['gjc'] = '@class.outer',
                    ['gjl'] = '@loop.outer',
                    ['gji'] = '@conditional.outer',
                },
                goto_next_end = {
                    ['gJe'] = '@assignment.outer',
                    ['gJa'] = '@attribute.outer',
                    ['gJb'] = '@block.outer',
                    ['gJk'] = '@call.outer',
                    ['gJo'] = '@comment.outer',
                    ['gJm'] = '@frame.outer',
                    ['gJx'] = '@regex.outer',
                    ['gJr'] = '@return.outer',
                    ['gJs'] = '@statement.outer',
                    ['gJp'] = '@parameter.outer',
                    ['gJf'] = '@function.outer',
                    ['gJc'] = '@class.outer',
                    ['gJl'] = '@loop.outer',
                    ['gJi'] = '@conditional.outer',
                },
                goto_previous_start = {
                    ['gke'] = '@assignment.outer',
                    ['gka'] = '@attribute.outer',
                    ['gkb'] = '@block.outer',
                    ['gkk'] = '@call.outer',
                    ['gko'] = '@comment.outer',
                    ['gkm'] = '@frame.outer',
                    ['gkx'] = '@regex.outer',
                    ['gkr'] = '@return.outer',
                    ['gks'] = '@statement.outer',
                    ['gkp'] = '@parameter.outer',
                    ['gkf'] = '@function.outer',
                    ['gkc'] = '@class.outer',
                    ['gkl'] = '@loop.outer',
                    ['gki'] = '@conditional.outer',
                },
                goto_previous_end = {
                    ['gKe'] = '@assignment.outer',
                    ['gKa'] = '@attribute.outer',
                    ['gKb'] = '@block.outer',
                    ['gKk'] = '@call.outer',
                    ['gKo'] = '@comment.outer',
                    ['gKm'] = '@frame.outer',
                    ['gKx'] = '@regex.outer',
                    ['gKr'] = '@return.outer',
                    ['gKs'] = '@statement.outer',
                    ['gKp'] = '@parameter.outer',
                    ['gKf'] = '@function.outer',
                    ['gKc'] = '@class.outer',
                    ['gKl'] = '@loop.outer',
                    ['gKi'] = '@conditional.outer',
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ['<leader>je'] = '@assignment.inner',
                    ['<leader>ja'] = '@attribute.inner',
                    ['<leader>jb'] = '@block.inner',
                    ['<leader>jk'] = '@call.inner',
                    ['<leader>jo'] = '@comment.inner',
                    ['<leader>jm'] = '@frame.inner',
                    ['<leader>jx'] = '@regex.inner',
                    ['<leader>jr'] = '@return.inner',
                    ['<leader>js'] = '@statement.inner',
                    ['<leader>jp'] = '@parameter.inner',
                    ['<leader>jf'] = '@function.inner',
                    ['<leader>jc'] = '@class.inner',
                    ['<leader>jl'] = '@loop.inner',
                    ['<leader>ji'] = '@conditional.inner',
                },
                swap_previous = {
                    ['<leader>ke'] = '@assignment.inner',
                    ['<leader>ka'] = '@attribute.inner',
                    ['<leader>kb'] = '@block.inner',
                    ['<leader>kk'] = '@call.inner',
                    ['<leader>ko'] = '@comment.inner',
                    ['<leader>km'] = '@frame.inner',
                    ['<leader>kx'] = '@regex.inner',
                    ['<leader>kr'] = '@return.inner',
                    ['<leader>ks'] = '@statement.inner',
                    ['<leader>kp'] = '@parameter.inner',
                    ['<leader>kf'] = '@function.inner',
                    ['<leader>kc'] = '@class.inner',
                    ['<leader>kl'] = '@loop.inner',
                    ['<leader>ki'] = '@conditional.inner',
                },
            },
        },
    }
end, 0)

-- Context sticky line at the top
require('treesitter-context').setup(
    {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        multiwindow = true, -- Enable multiwindow support.
        max_lines = -1, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 1, -- Maximum number of lines to show for a single context
        trim_scope = 'inner', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20, -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    }
)

