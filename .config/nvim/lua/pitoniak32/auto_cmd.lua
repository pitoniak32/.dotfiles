local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

-- local format_group = augroup("FormatOnSave", {})
--
-- autocmd("BufWritePre", {
--   group = format_group,
--   pattern = "*",
--   callback = function ()
--     vim.lsp.buf.formatting()
--   end,
-- })
