local dap = require('dap')
local ui = require('dapui')

dap.listeners.after.event_initialized["dapui_config"] = function()
    ui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    ui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    ui.close()
end

dap.defaults.fallback.terminal_win_cmd = '50vsplit new'  -- or 'botright split new'

dap.adapters.python = {
    type = 'executable',
    command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/Scripts/python",
    -- command = "C:/Users/aPodo/anaconda3/python",
    args = { '-m', 'debugpy.adapter', },
}

dap.configurations.python = {
    {
        type = 'python';
        name = "Launch file";
        request = 'launch';
        program = "${file}";
        console = "internalConsole",
        pythonPath = function()
            return vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/Scripts/python" 
        end;
    },
}

dap.adapters.lua = {
    type = 'executable',
    command = 'lua',
    args = { }
}

dap.configurations.lua = {
    {
        type = 'lua',
        request = 'launch',
        name = "Launch Lua file",
        program = function()
            return vim.fn.expand("%:p")
        end,
        cwd = '${workspaceFolder}',
        -- stopOnEntry = true,
        args = {},
        -- sourceMaps = false,
    },
}

vim.fn.sign_define('DapBreakpoint', { text = '󰨰', texthl = 'DapBreakpoint', linehl = '', numhl = '' })

vim.keymap.set("n", "<leader>pt", function() dap.toggle_breakpoint() end, { desc = '[T]oggle [B]reak point' })
vim.keymap.set('n', '<Leader>pb', function() dap.set_breakpoint() end, { desc = '[S]et [B]reak point' })
vim.keymap.set('n', '<Leader>ps', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { desc = '[S]et [B]reak point (with message)' })

vim.keymap.set("n", "<leader>pc", function() dap.continue() end, { desc = '[C]ontinue' })
vim.keymap.set("n", "<leader>pov", function() dap.step_over() end, { desc = 'Step [Ov]er' })
vim.keymap.set('n', '<leader>pot', function() dap.step_out() end, { desc = 'Step [O]ut' })
vim.keymap.set("n", "<leader>pi", function() dap.step_into() end, { desc = 'Step [I]nto' })

vim.keymap.set("n", "<leader>pr", function() dap.repl.open() end, { desc = 'Inspect state' })
vim.keymap.set("n", "<leader>pe", function() 
    dap.terminate()
end, { desc = '[E]nd session' })

    -- vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>pwh', function()
    require('dap.ui.widgets').hover()
end, {desc = '[W]idget [H]over'})
vim.keymap.set({'n', 'v'}, '<Leader>pwp', function()
    require('dap.ui.widgets').preview()
end, {desc = '[W]idget [P]review'})

vim.keymap.set('n', '<Leader>pwc', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end, {desc = '[W]idget [F]loat'})

vim.keymap.set('n', '<Leader>pws', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end, {desc = '[W]idget [S]copes'})

