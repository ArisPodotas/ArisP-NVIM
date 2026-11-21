local gs = require('gitsigns')
local maps = {}

gs.setup(
    {
        -- signs = {
        --     add = { text = '+' },
        --     change = { text = '~' },
        --     delete = { text = '_' },
        --     topdelete = { text = '‾' },
        --     changedelete = { text = '|' },
        -- },
        on_attach = function(bufnr)
            -- local gs = package.loaded.gitsigns
            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end
            -- Navigation
            map({ 'n', 'v' }, '<leader>ghj', function()
                if vim.wo.diff then
                    return ']c'
                end
                vim.schedule(function()
                    gs.next_hunk()
                end)
                return '<Ignore>'
            end, { expr = true, desc = 'Jump to next hunk' })
            map({ 'n', 'v' }, '<leader>ghk', function()
                if vim.wo.diff then
                    return '[c'
                end
                vim.schedule(function()
                    gs.prev_hunk()
                end)
                return '<Ignore>'
            end, { expr = true, desc = 'Jump to previous hunk' })
            -- visual mode
            map('v', '<leader>ghs', function()
                gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
            end, { desc = 'stage git hunk' })
            map('v', '<leader>ghr', function()
                gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
            end, { desc = 'reset git hunk' })
            -- normal mode
            map('n', '<leader>ghs', gs.stage_hunk, { desc = 'git stage hunk' })
            map('n', '<leader>ghr', gs.reset_hunk, { desc = 'git reset hunk' })
            map('n', '<leader>ghS', gs.stage_buffer, { desc = 'git Stage buffer' })
            map('n', '<leader>ghu', gs.undo_stage_hunk, { desc = 'undo stage hunk' })
            map('n', '<leader>ghR', gs.reset_buffer, { desc = 'git Reset buffer' })
            map('n', '<leader>ghp', gs.preview_hunk, { desc = 'preview git hunk' })
            map('n', '<leader>ghb', function()
                gs.blame_line { full = false }
            end, { desc = 'git blame line' })
            map('n', '<leader>ghd', gs.diffthis, { desc = 'git diff against index' })
            map('n', '<leader>ghD', function()
                gs.diffthis '~'
            end, { desc = 'git diff against last commit' })
            -- Toggles
            map('n', '<leader>gB', gs.toggle_current_line_blame, { desc = 'toggle git blame line' })
            map('n', '<leader>gd', gs.toggle_deleted, { desc = 'toggle git show deleted' })
            -- Text object
            map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' })
        end,
    }
)

--Git
vim.keymap.set("n", '<leader>gc', ":Git commit<CR>", { desc = '[C]ommit changes' })
vim.keymap.set("n", '<leader>gf', ":Git add .<CR>:Git commit<CR>", { desc = 'Add and Commit' })
vim.keymap.set("n", '<leader>gl', ":Git log<CR>", { desc = 'Git [L]og' })
vim.keymap.set("n", '<leader>gt', ":Git log --graph --pretty=format:'%h -%d %s (%cr) <%an>' --abbrev-commit --date=relative --all<CR>", { desc = 'Git [L]og [T]ree Full' })
vim.keymap.set("n", '<leader>gs', ":Git status --ignored<CR>", { desc = 'Git [S]tatus' })
vim.keymap.set("n", '<leader>gi', ":Git init .<CR>", { desc = 'Git [I]nitialize' })
vim.keymap.set("n", '<leader>grr', ":Git remote -v<CR>", { desc = 'Git [R]emote -[V]' })
vim.keymap.set("n", '<leader>gra', ":Git remote add ", { desc = 'Git [R]emote -[V]' })
vim.keymap.set("n", '<leader>gps', ":Git push ", { desc = 'Git [P]ush' })
vim.keymap.set("n", '<leader>gpl', ":Git pull ", { desc = 'Git [P]ull' })
vim.keymap.set("n", '<leader>ga', ":Git add ", { desc = 'Git [A]dd' })
vim.keymap.set("n", '<leader>gb', ":Git branch<CR>:Git checkout ", { desc = 'Git [B]ranch' })
vim.keymap.set("n", '<leader>gd', ":Git diff --stat<CR>", { desc = 'Git [D]ifferences' })
