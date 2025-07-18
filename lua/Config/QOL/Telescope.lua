-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

require('telescope').setup({
    defaults = {
        cycle_layout_list = {'horizontal', 'vertical', 'center', 'bottom_pane'},
        layout_strategy = 'horizontal',
        layout_config = {
            horizontal = {
                height = 0.9,
                preview_cutoff = 1,
                prompt_position = "top",
                width = 0.9
            },
            cursor = { -- I don't like this one
                height = 0.9,
                preview_cutoff = 1,
                width = 0.9
            },
            bottom_pane = {
                height = 25,
                preview_cutoff = 1,
                prompt_position = "top"
            },
            vertical = {
                height = 0.9,
                preview_cutoff = 1,
                prompt_position = "bottom",
                width = 0.9
            },
            center = {
                height = 0.9,
                preview_cutoff = 1,
                prompt_position = "top",
                width = 0.9
            },
        },
        mappings = {
            i = { -- Insert mode mappings
                ["<A-t>"] = require('telescope.actions.layout').cycle_layout_next,
            },
            n = { -- Normal mode mappings (inside Telescope)
                ["<A-t>"] = require('telescope.actions.layout').cycle_layout_next,
            },
        },
        extensions = {
            aerial = {
                -- Set the width of the first two columns (the second
                -- is relevant only when show_columns is set to 'both')
                col1_width = 4,
                col2_width = 30,
                -- How to format the symbols
                format_symbol = function(symbol_path, filetype)
                    if filetype == "json" or filetype == "yaml" then
                        return table.concat(symbol_path, ".")
                    else
                        return symbol_path[#symbol_path]
                    end
                end,
                -- Available modes: symbols, lines, both
                show_columns = "both",
            },
        },
    }
})

local tl = require("telescope.builtin")

-- vim.keymap.set('n', '<A-q>', function() require('telescope.actions.layout').cycle_layout_next() end, {desc = '[C]ycle telescope layout'})

-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
    -- Use the current buffer's path as the starting point for the git search
    local current_file = vim.api.nvim_buf_get_name(0)
    local current_dir
    local cwd = vim.fn.getcwd()
    -- If the buffer is not associated with a file, return nil
    if current_file == '' then
        current_dir = cwd
    else
        -- Extract the directory from the current file's path
        current_dir = vim.fn.fnamemodify(current_file, ':h')
    end
    -- Find the Git root directory from the current file's path
    local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
    if vim.v.shell_error ~= 0 then
        print 'Not a git repository. Searching on current working directory'
        return cwd
    end
    return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
    local git_root = find_git_root()
    if git_root then
        tl.live_grep {
            search_dirs = { git_root },
        }
    end
end

vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

local function telescope_live_grep_open_files()
    tl.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
    }
end

vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })


-- vim.keymap.set("n", "<leader>br", function()
--     tl.oldfiles(require('telescope.themes').get_dropdown({theme = 'dropdown'}))
-- end, { desc = "[?] Find recently opened files" })

-- vim.keymap.set("n", "<leader>bb", function()
--     tl.buffers(require('telescope.themes').get_dropdown({theme='dropdown'}))
-- end, { desc = "[ ] Find existing buffers" })

-- vim.keymap.set("n", "<leader>bf", function()
-- 	tl.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
-- 		theme = "dropdown",
-- 	}))
-- end, { desc = "[/] Fuzzily search in current buffer" })

-- vim.keymap.set("n", "<leader>ss", function()
--     tl.builtin(require('telescope.themes').get_dropdown({theme = 'dropdown'}))
-- end, { desc = "[S]earch [S]elect Telescope" })

-- vim.keymap.set("n", "<A-g>", function()
--     tl.git_files(require('telescope.themes').get_dropdown({theme = 'dropdown'}))
-- end, { desc = "Search [G]it [F]iles" })

-- vim.keymap.set("n", "<A-f>", function()
--     tl.find_files(require('telescope.themes').get_dropdown({theme = 'dropdown'}))
-- end, { desc = "[F]ind [F]iles" })

-- vim.keymap.set("n", "<leader>sh", function()
--     tl.help_tags(require('telescope.themes').get_dropdown({theme = 'dropdown'}))
-- end, { desc = "[S]earch [H]elp" })

-- vim.keymap.set("n", "<leader>sg", function()
--     tl.live_grep(require('telescope.themes').get_dropdown({theme = 'dropdown'}))
-- end, { desc = "[S]earch by [G]rep" })

-- vim.keymap.set("n", "<leader>sd", function()
--     tl.diagnostics(require('telescope.themes').get_dropdown({theme = 'dropdown'}))
-- end, { desc = "[S]earch [D]iagnostics" })

-- vim.keymap.set("n", "<leader>sr", function()
--     tl.resume(require('telescope.themes').get_dropdown({theme = 'dropdown'}))
-- end, { desc = "[S]earch [R]esume" })

-- Different theme

vim.keymap.set("n", "<leader>br", function()
    tl.oldfiles()
end, { desc = "[?] Find recently opened files" })

vim.keymap.set("n", "<leader>bb", function()
    tl.buffers()
end, { desc = "[ ] Find existing buffers" })

vim.keymap.set("n", "<leader>bf", function()
	tl.current_buffer_fuzzy_find()
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>ss", function()
    tl.builtin()
end, { desc = "[S]earch [S]elect Telescope" })

vim.keymap.set("n", "<A-g>", function()
    tl.git_files()
end, { desc = "Search [G]it [F]iles" })

vim.keymap.set("n", "<A-f>", function()
    tl.find_files()
end, { desc = "[F]ind [F]iles" })

vim.keymap.set("n", "<leader>sh", function()
    tl.help_tags()
end, { desc = "[S]earch [H]elp" })

vim.keymap.set("n", "<leader>sg", function()
    tl.live_grep()
end, { desc = "[S]earch by [G]rep" })

vim.keymap.set("n", "<leader>sd", function()
    tl.diagnostics()
end, { desc = "[S]earch [D]iagnostics" })

vim.keymap.set("n", "<leader>sr", function()
    tl.resume()
end, { desc = "[S]earch [R]esume" })

