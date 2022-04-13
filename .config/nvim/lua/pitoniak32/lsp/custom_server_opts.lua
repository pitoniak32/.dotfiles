local typescript = {
	on_attach = function(default_on_attach)
		return function(client, bufnr)
			if default_on_attach then
				default_on_attach(client, bufnr)
			end
			client.resolved_capabilities.document_formatting = false
		end
	end,
}

local sumneko_lua = {
	on_attach = function(default_on_attach)
		return function(client, bufnr)
			default_on_attach(client, bufnr)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false
		end
	end,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}

local pyright = {
	on_attach = function(default_on_attach)
		return function(client, bufnr)
			default_on_attach(client, bufnr)
		end
	end,
}

-- if client.name == "html" or client.name == "jdt.ls" then
--   client.resolved_capabilities.document_formatting = false
-- end

M = {}

M.servers = {
	tsserver = typescript,
	sumneko_lua = sumneko_lua,
	pyright = pyright,
}

return M
