local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank {
      higroup = "IncSearch",
      timeout = 40,
    }
  end,
})

autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local last_line = vim.api.nvim_buf_get_lines(0, -2, -1, false)[1]
    if last_line ~= "" then
      vim.api.nvim_buf_set_lines(0, -1, -1, false, { "" })
    end
  end,
})

