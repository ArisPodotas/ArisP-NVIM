-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- This is like my first own lua function
-- These functions are used in the command remaps section
local function powershell()
  vim.cmd.tabnew()
  vim.fn.termopen("powershell")
end

local function bash()
  vim.cmd.tabnew()
  vim.fn.termopen("bash")
end

local function termsplith()
  vim.cmd.sp()
  vim.cmd.terminal("powershell")
end

local function termsplitv()
  vim.cmd.vs()
  vim.cmd.terminal("powershell")
end

local function direct()
  vim.cmd.cd("%")
  vim.cmd.pwd()
end

local function bashv()
  vim.cmd.vs()
  vim.cmd.terminal("bash")
end

local function bashh()
  vim.cmd.sp()
  vim.cmd.terminal("bash")
end

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Command remaps
vim.keymap.set("n", "<leader>x", vim.cmd.Ex, { desc = 'Return to [Ex]plorer' })
vim.keymap.set("n", "<leader>T", vim.cmd.tabnew, { desc = 'Opens a new vim [T]ab' })
vim.keymap.set("n", "<leader>o", direct, { desc = 'Changes direct[O]ry to current view' })

-- Terminal splits
vim.keymap.set("n", "<leader>tt", powershell, { desc = 'Opens the powershell [T]erminal in a new tab' })
vim.keymap.set("n", "<leader>tb", bash, { desc = 'Opens [B]ash [T]erminal in a new tab' })
vim.keymap.set("n", "<leader>it", termsplitv, { desc = 'Opens [T]erminal in a [V]ertical split' })
vim.keymap.set("n", "<leader>ib", bashv, { desc = 'Opens [B]ash terminal in a vertical [S]plit' })
vim.keymap.set("n", "<leader>ut", termsplith, { desc = 'Opens [T]erminal [S]plit' })
vim.keymap.set("n", "<leader>ub", bashh, { desc = 'Opens [B]ash terminal [S]plit' })

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

-- Remapping replacing in file
vim.keymap.set("n", "<leader>R", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>", { desc = 'find and [R]eplace {x} under cursor' })
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = '[P]aste over highlighted without replacing buffer' })

-- Tree sitter parser
vim.keymap.set("n", "<leader>`", vim.cmd.InspectTree, { desc = "Tree sitter parser pane" })

-- Control T section

-- Keymaps that will most likeley remain uncahnged forever

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Visual line mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move highlghted lines down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move highlghted lines up' })

-- Remapping page jumps to center screen
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Center screen after half page jump' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Center screen after half page jump' })
vim.keymap.set("n", "{", "{zz", { desc = 'Center screen after code block jump' })
vim.keymap.set("n", "}", "}zz", { desc = 'Center screen after code block jump' })
vim.keymap.set("n", "n", "nzzzv", { desc = 'Center screen after [n]ext jump' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'Center screen after [N]ext jump' })

