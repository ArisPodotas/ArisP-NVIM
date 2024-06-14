--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- These functions are used in the command remaps section
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

--[[local function toggle()
-- vim.opt.list = true
-- vim.opt.listchars = { space = '·', eol = '$' }
end
--]]

--[[local function toggle()
-- vim.opt.list = false
end
--]]

-- local function Switch()
--   require("switch")
-- end
--
-- local function pgup()
--   -- implement the font size change
-- end
--
-- local function pgdown()
--   -- Implement the font change down
-- end

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Command remaps
vim.keymap.set("n", "<leader>x", vim.cmd.Ex, { desc = 'Return to [Ex]plorer' })
vim.keymap.set("n", "<leader>T", vim.cmd.tabnew, { desc = 'Opens a new vim [T]ab' })

-- Will not work when multiple windows are open
vim.keymap.set("n", "<leader>o", function()
  vim.cmd.cd("%")
  vim.cmd.cd(".")
  vim.cmd.pwd()
end, { desc = 'Changes direct[O]ry to current view' })

-- Terminal splits
vim.keymap.set("n", "<leader>tt", function()
  vim.cmd.tabnew()
  vim.fn.termopen("powershell")
end, { desc = 'Opens the powershell [T]erminal in a new tab' })

vim.keymap.set("n", "<leader>tb", function()
  vim.cmd.tabnew()
  vim.fn.termopen("bash")
end, { desc = 'Opens [B]ash [T]erminal in a new tab' })

vim.keymap.set("n", "<leader>it", function()
  vim.cmd.vs()
  vim.cmd.terminal("powershell")
end, { desc = 'Opens [T]erminal in a [V]ertical split' })

vim.keymap.set("n", "<leader>ib", function()
  vim.cmd.vs()
  vim.cmd.terminal("bash")
end, { desc = 'Opens [B]ash terminal in a vertical [S]plit' })

vim.keymap.set("n", "<leader>ut", function()
  vim.cmd.sp()
  vim.cmd.terminal("powershell")
end, { desc = 'Opens [T]erminal [S]plit' })

vim.keymap.set("n", "<leader>ub", function()
  vim.cmd.sp()
  vim.cmd.terminal("bash")
end, { desc = 'Opens [B]ash terminal [S]plit' })

-- Terminal exit
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = 'Makes escape return to normal mode in the terminal' })
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>", { desc = 'Makes control [ return to normal mode in the terminal' })

-- Splits remaps
vim.keymap.set("n", "<leader>ii", "<C-w>v", { desc = 'Opens a vertical split' })
vim.keymap.set("n", "<leader>uu", "<C-w>s", { desc = 'Opens a split' })

--[[ These don't work properly becuase the next input isnt picked up as a control w its a plain key
vim.keymap.set("n", "<C-w>h", "<C-w>h<C-w>", { desc = 'Go to the left window' })
vim.keymap.set("n", "<C-w>j", "<C-w>j<C-w>", { desc = 'Go to the window below' })
vim.keymap.set("n", "<C-w>k", "<C-w>k<C-w>", { desc = 'Go to the window above' })
vim.keymap.set("n", "<C-w>l", "<C-w>l<C-w>", { desc = 'Go to the window to the right' })

Thing i stole form the documentation for remaping the save command
vim.keymap.set('n', '<leader>w', "<cmd>w<cr>", { silent = true, buffer = 5 })
--]]

-- Character listings
-- vim.keymap.set("n", "Lt", toggle(), { desc = "Toggles the space tab and eol characters" })

-- Remapping replacing in file
vim.keymap.set("n", "<leader>R", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>", { desc = 'find and [R]eplace {x} under cursor' })
vim.keymap.set("x", "<leader>P", "\"_dP", { desc = '[P]aste over highlighted without replacing buffer' })

-- Tree sitter parser
vim.keymap.set("n", "<leader>`", vim.cmd.InspectTree, { desc = "Tree sitter parser pane" })

-- KSwitch
-- Now renamed to nvim3D
-- vim.keymap.set("n", "<leader>`", Switch, { desc = "Change all remapst to switch.lua" })

-- Harpoon
vim.keymap.set("n", "<leader>p", function() harpoon:list():append() end, { desc = 'Appends the file to the har[P]oon list' })
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Opens the harpoon m[E]nu' })

vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end, { desc = "Opens first harpoon listing file" })
vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end, { desc = "Opens second harpoon listing file" })
vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end, { desc = "Opens third harpoon listing file" })
vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end, { desc = "Opens fourth harpoon listing file" })
vim.keymap.set("n", "<A-5>", function() harpoon:list():select(5) end, { desc = "Opens first harpoon listing file" })
vim.keymap.set("n", "<A-6>", function() harpoon:list():select(6) end, { desc = "Opens first harpoon listing file" })
vim.keymap.set("n", "<A-7>", function() harpoon:list():select(7) end, { desc = "Opens first harpoon listing file" })
vim.keymap.set("n", "<A-8>", function() harpoon:list():select(8) end, { desc = "Opens first harpoon listing file" })
vim.keymap.set("n", "<A-9>", function() harpoon:list():select(9) end, { desc = "Opens first harpoon listing file" })

vim.keymap.set("n", "<A-t>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
vim.keymap.set("n", "<A-j>", function() harpoon:list():next() end)
vim.keymap.set("n", "<A-k>", function() harpoon:list():prev() end)

-- Control T section

-- Telescope
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
    theme = "dropdown"
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

-- Keymaps that will most likeley remain uncahnged forever

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Visual line mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move highlighted lines down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move highlighted lines up' })

-- Remapping page jumps to center screen
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Center screen after half page jump' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Center screen after half page jump' })
vim.keymap.set("n", "{", "{zz", { desc = 'Center screen after code block jump' })
vim.keymap.set("n", "}", "}zz", { desc = 'Center screen after code block jump' })
vim.keymap.set("n", "n", "nzzzv", { desc = 'Center screen after [n]ext jump' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'Center screen after [N]ext jump' })

-- keybinds that remain un binded for future use
--
