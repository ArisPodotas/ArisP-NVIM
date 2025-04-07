-- Harpoon
local harpoon = require("harpoon")

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end
    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

-- List edits
vim.keymap.set("n", "<A-a>", function() harpoon:list():add() end, { desc = '[A]ppends the file to the harpoon list' })
vim.keymap.set("n", "<A-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Opens the harpoon m[E]nu' })
vim.keymap.set("n", "<A-s>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window in telescope [S]earch" })
-- Jumps
vim.keymap.set("n", "<A-0>", function() harpoon:list():select(0) end, { desc = "Opens 0th(?) harpoon listing file" })
vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end, { desc = "Opens first harpoon listing file" })
vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end, { desc = "Opens second harpoon listing file" })
vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end, { desc = "Opens third harpoon listing file" })
vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end, { desc = "Opens fourt harpoon listing file" })
vim.keymap.set("n", "<A-5>", function() harpoon:list():select(5) end, { desc = "Opens fifth harpoon listing file" })
vim.keymap.set("n", "<A-6>", function() harpoon:list():select(6) end, { desc = "Opens sixth harpoon listing file" })
vim.keymap.set("n", "<A-7>", function() harpoon:list():select(7) end, { desc = "Opens seventh harpoon listing file" })
vim.keymap.set("n", "<A-8>", function() harpoon:list():select(8) end, { desc = "Opens eighth harpoon listing file" })
vim.keymap.set("n", "<A-9>", function() harpoon:list():select(9) end, { desc = "Opens ninth harpoon listing file" })
-- And the best ones
vim.keymap.set("n", "<A-n>", function() harpoon:list():next() end, {desc = "[N]ext harpoon listing" })
vim.keymap.set("n", "<A-p>", function() harpoon:list():prev() end, {desc = "[P]revious harpoon listing" })


