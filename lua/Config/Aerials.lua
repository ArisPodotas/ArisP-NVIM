-- In the sky, when you ... small .....
--
require('aerial').setup(
    {
    }
)

vim.keymap.set("n", "<leader>aa", "<cmd>AerialToggle!<CR>", {desc = '[A]erial Toggle'})

