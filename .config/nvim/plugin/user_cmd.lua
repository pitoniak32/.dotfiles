local user_cmd = vim.api.nvim_create_user_command

user_cmd("QfSortByPath", function()
  local qflist = vim.fn.getqflist()
  table.sort(qflist, function(a, b)
    local path_a = vim.api.nvim_buf_get_name(a.bufnr) or ""
    local path_b = vim.api.nvim_buf_get_name(b.bufnr) or ""
    return path_a < path_b
  end)
  vim.fn.setqflist(qflist, "r")
  print "[qflist] sorted by path."
end, { desc = "Sort qflist by file path" })

