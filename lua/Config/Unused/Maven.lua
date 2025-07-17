-- In case I do that supermaiven zduff
require("supermaven-nvim").setup(
    {
        ignore_filetypes = {}, -- or { "cpp", }
        color = {
            suggestion_color = "#ffffff",
            cterm = 244,
        },
        log_level = "info",
        disable_inline_completion = true, -- disables inline completion for use with cmp
        disable_keymaps = true, -- disables built in keymaps for more manual control
        condition = function()
            return false
        end -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
    }
)

