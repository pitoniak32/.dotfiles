M = {}

M.enable_format_on_save = function()
  vim.cmd([[
    augroup format_on_save
      autocmd!
      autocmd BufWritePre * lua vim.lsp.buf.formatting()
    augroup end
  ]])
  vim.notify("Enabled format on save")
end

M.disable_format_on_save = function()
  M.remove_augroup("format_on_save")
  vim.notify("Disabled format on save")
end

M.toggle_format_on_save = function()
  if vim.fn.exists("#format_on_save#BufWritePre") == 0 then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

M.remove_augroup = function(name)
  if vim.fn.exists("#" .. name) == 1 then
    vim.cmd("au! " .. name)
  end
end


return M
