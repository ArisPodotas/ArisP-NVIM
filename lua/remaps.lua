-- Important I just found out that %s works because % is the current file, '<,'>s is the equivalent for only the highlight Note no %s just s.
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Terminal
vim.keymap.set("n", "<leader>x", vim.cmd.Ex, { desc = 'Return to [Ex]plorer' })
vim.keymap.set("n", "<leader>H", ':cd C:/Users/aPodo/<CR>', { desc = 'Returns to [H]ome directory' })

-- Autosave
-- These should be at the top
vim.keymap.set("i", "<Esc>", '<Esc>:w<CR>', { desc = 'Autosaves on [E]xit' })
vim.keymap.set("n", "x", 'x:w<CR>', { desc = 'Autosaves on [X]' })
vim.keymap.set("n", "u", 'u:w<CR>', { desc = 'Autosaves on [U]ndo' })
vim.keymap.set("n", "<C-r>", '<C-r>:w<CR>', { desc = 'Autosaves on [R]edo' })
vim.keymap.set("n", "p", 'p:w<CR>', { desc = 'Autosaves on [P]aste' })
vim.keymap.set("n", "dd", 'dd:w<CR>', { desc = 'Autosaves on [D]elete' })
vim.keymap.set("v", "d", 'd:w<CR>', { desc = 'Autosaves on [D]elete' })

-- Keymaps that will most likely remain uncahnged forever

-- Thanks prime
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move highlighted lines down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move highlighted lines up' })

-- vim.keymap.set("n", "<CR>", "i<CR>", { desc = 'Adds a newline where the cursor is to write' })
vim.keymap.set("n", "<leader><CR>", "i<CR><C-c>", { desc = 'Adds a newline at cursor position' })
vim.keymap.set("i", "<C-v>", "<C-c>p", { desc = 'pastest clipboard in insert mode' })

-- Remapping page jumps to center screen
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Center screen after half page jump' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Center screen after half page jump' })
vim.keymap.set("n", "{", "{zz", { desc = 'Center screen after code block jump' })
vim.keymap.set("n", "}", "}zz", { desc = 'Center screen after code block jump' })
vim.keymap.set("n", "n", "nzzzv", { desc = 'Center screen after [n]ext jump' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'Center screen after [N]ext jump' })

-- Terminal exit
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = 'Makes escape return to normal mode in the terminal' })
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>", { desc = 'Makes control [ return to normal mode in the terminal' })

-- Makes the terminal a little more vimy
vim.keymap.set("n", ":", ":<C-f>i", { desc = 'Always opens the terminal in vim mode' })

-- Makes me do less strokes could be removed and obv bypass the terminal (justify the placement here)
vim.keymap.set("n", "zj", vim.cmd.w, { desc = '[S]ave' })
-- vim.keymap.set("n", "zj", ":w<CR>", { desc = '[S]ave' })
-- vim.keymap.set("n", "zk", ":w<CR>q<CR>", { desc = '[Q]uits' })
vim.keymap.set("n", "zk", vim.cmd.q, { desc = '[Q]uits' })

-- Change directory
vim.keymap.set("n", "<leader>o", function()
  if pcall(function()
    vim.cmd.cd("%")
    vim.cmd.cd(".")
  end) ~= 0 then vim.cmd.pwd()
  elseif vim.api.nvim_buf_get_name(0) then
    print('you identified being in the file proeperly')
  else
    vim.cmd.cd("%")
    vim.cmd.cd(".")
    vim.cmd.pwd()
  end
end, { desc = 'Changes direct[O]ry to current view' })

-- Tab section
vim.keymap.set("n", "<leader>T", vim.cmd.tabnew, { desc = 'Opens a new vim [T]ab' })
vim.keymap.set("n", "<A-t>", ":tabn<CR>", { desc = 'Will change [T]ab' })

vim.keymap.set("n", "<leader>tt", function()
  vim.cmd.tabnew()
  vim.fn.termopen("powershell")
end, { desc = 'Opens the powershell [T]erminal in a new tab' })

vim.keymap.set("n", "<leader>tu", function()
  vim.cmd.tabnew()
  vim.fn.termopen("ubuntu")
end, { desc = 'Opens the [U]buntu [T]erminal in a new tab' })

-- splits section
vim.keymap.set("n", "<C-w>c", ":wincmd H<CR>", { desc = 'Will make the [W]indow from horizontal to vertical' })
vim.keymap.set("n", "<C-w>e", ":wincmd K<CR>", { desc = 'Will make the [W]indow from vertical to horizontal' })

-- Vertical section
vim.keymap.set("n", "<leader>ii", function()
  vim.cmd.vs()
end, { desc = 'Opens vert[I]cal split' })

vim.keymap.set("n", "<leader>it", function()
  vim.cmd.vs()
  vim.cmd.terminal("powershell")
end, { desc = 'Opens [T]erminal in a [V]ertical split' })

vim.keymap.set("n", "<leader>iu", function()
  vim.cmd.vs()
  vim.cmd.terminal("ubuntu")
end, { desc = 'Opens [U]buntu in a [V]ertical split' })

-- Under section
vim.keymap.set("n", "<leader>uu", function()
  vim.cmd.sp()
end, { desc = 'Opens [S]plit' })

vim.keymap.set("n", "<leader>ut", function()
  vim.cmd.sp()
  vim.cmd.terminal("powershell")
end, { desc = 'Opens [T]erminal [S]plit' })

vim.keymap.set("n", "<leader>ub", function()
  vim.cmd.sp()
  vim.cmd.terminal("ubuntu")
end, { desc = 'Opens u[B]untu [S]plit' })

vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = 'Go to Left split in view' })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = 'Go to Right split in view' })
vim.keymap.set("n", "+", "<C-w>3>", { desc = 'Increase width of split by 3' })
vim.keymap.set("n", "-", "<C-w>3<", { desc = 'Decrease width of split by 3' })

-- Remapping replacing in file
vim.keymap.set("n", "<leader>rr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>", { desc = 'find and [R]eplace {x} under cursor' })
vim.keymap.set("x", "<leader>P", "\"_dP", { desc = '[P]aste over highlighted without replacing buffer' })

-- Tree sitter parser
vim.keymap.set("n", "<leader>`", vim.cmd.InspectTree, { desc = "Tree sitter parser pane" })

--buffers 
--This might change
vim.keymap.set("n", "<leader>bl", ":ls<CR>", { desc = '[L]ist all [B]uffers' })
vim.keymap.set("n", "<leader>bn", ":bn<CR>", { desc = 'go to [N]ext [B]uffer' })
vim.keymap.set("n", "<leader>bp", ":bp<CR>", { desc = 'go to [P]revious [B]uffer' })

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
vim.keymap.set("n", "<A-p>", function() harpoon:list():add() end, { desc = 'Appends the file to the har[P]oon list' })
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
vim.keymap.set("n", "<A-j>", function() harpoon:list():next() end)
vim.keymap.set("n", "<A-k>", function() harpoon:list():prev() end)

-- Telescope
vim.keymap.set('n', '<leader>br', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>bb', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>bf', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
    theme = "dropdown"
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

--Git
vim.keymap.set("n", '<leader>gc', ":Git commit<CR>", { desc = '[C]ommit changes' })
vim.keymap.set("n", '<leader>gl', ":Git log<CR>", { desc = 'Git [L]og' })
vim.keymap.set("n", '<leader>gt', ":Git log --graph --pretty=format:'%h -%d %s (%cr) <%an>' --abbrev-commit --date=relative --all<CR>", { desc = 'Git [L]og [T]ree Full' })
vim.keymap.set("n", '<leader>gs', ":Git status --ignored<CR>", { desc = 'Git [S]tatus' })
vim.keymap.set("n", '<leader>gi', ":Git init .<CR>", { desc = 'Git [I]nitialize' })
vim.keymap.set("n", '<leader>gr', ":Git remote -v<CR>", { desc = 'Git [R]emote -[V]' })
vim.keymap.set("n", '<leader>gps', ":Git push ", { desc = 'Git [P]ush' })
vim.keymap.set("n", '<leader>gpl', ":Git pull ", { desc = 'Git [P]ull' })
vim.keymap.set("n", '<leader>ga', ":Git add ", { desc = 'Git [A]dd' })
vim.keymap.set("n", '<leader>gb', ":Git branch<CR>:Git checkout ", { desc = 'Git [B]ranch' })

-- Diagnostic keymaps
vim.keymap.set('n', 'gjd', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', 'gkd', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Variable to track diagnostic visibility state
local diagnostics_active = true

function ToggleDiagnostics()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
        vim.diagnostic.enable()
        print("Diagnostics enabled")
    else
        vim.diagnostic.enable(false)
        print("Diagnostics disabled")
    end
end

vim.keymap.set('n', '<leader>dt', ':lua ToggleDiagnostics()<CR>', { desc = "[T]oggle [D]iagnostics" })

