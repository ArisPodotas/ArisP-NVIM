require('vimscape2007').setup({})

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        vim.cmd("Vimscape flush")
    end,
})
