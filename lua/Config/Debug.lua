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

