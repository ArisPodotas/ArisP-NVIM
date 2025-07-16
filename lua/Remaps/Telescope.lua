local tl = require("telescope.builtin")

vim.keymap.set("n", "<leader>br", function()
    tl.oldfiles(require('telescope.themes').get_dropdown({theme = 'dropdown'}))
end, { desc = "[?] Find recently opened files" })

vim.keymap.set("n", "<leader>bb", function()
    tl.buffers(require('telescope.themes').get_dropdown({theme='dropdown'}))
end, { desc = "[ ] Find existing buffers" })

vim.keymap.set("n", "<leader>bf", function()
	tl.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		theme = "dropdown",
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>ss", function()
    tl.builtin(require('telescope.themes').get_dropdown({theme = 'dropdown'}))
end, { desc = "[S]earch [S]elect Telescope" })

vim.keymap.set("n", "<A-g>", function()
    tl.git_files(require('telescope.themes').get_dropdown({theme = 'dropdown'}))
end, { desc = "Search [G]it [F]iles" })

vim.keymap.set("n", "<A-f>", function()
    tl.find_files(require('telescope.themes').get_dropdown({theme = 'dropdown'}))
end, { desc = "[F]ind [F]iles" })

vim.keymap.set("n", "<leader>sh", function()
    tl.help_tags(require('telescope.themes').get_dropdown({theme = 'dropdown'}))
end, { desc = "[S]earch [H]elp" })

vim.keymap.set("n", "<leader>sg", function()
    tl.live_grep(require('telescope.themes').get_dropdown({theme = 'dropdown'}))
end, { desc = "[S]earch by [G]rep" })

vim.keymap.set("n", "<leader>sd", function()
    tl.diagnostics(require('telescope.themes').get_dropdown({theme = 'dropdown'}))
end, { desc = "[S]earch [D]iagnostics" })

vim.keymap.set("n", "<leader>sr", function()
    tl.resume(require('telescope.themes').get_dropdown({theme = 'dropdown'}))
end, { desc = "[S]earch [R]esume" })

