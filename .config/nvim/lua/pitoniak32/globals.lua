P = function(v)
	print(vim.inspect(v))
	return v
end

RELOAD = function(...)
	return require("plenary.reload").reload_module(...)
end

R = function(name)
	RELOAD(name)
	return require(name)
end

M = {}

-- Save current file and execute it.
M.save_and_exec = function()
	if vim.bo.filetype == "vim" then
		vim.cmd([[silent! write]])
		vim.cmd([[source %]])
	elseif vim.bo.filetype == "lua" then
		vim.cmd([[silent! write]])
		vim.cmd([[luafile %]])
	end
end

return M
