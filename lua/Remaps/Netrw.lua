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

