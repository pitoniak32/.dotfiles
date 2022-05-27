local tsserver = {
	on_attach = function(client, bufnr)
    require("pitoniak32.lsp.default_handlers").default_attach(client, bufnr)
    client.server_capabilities.document_formatting = false
  end,
  init_options = {
    preferences = {
      importModuleSpecifierPreference = "relative"
    },
  },
}

local sumneko_lua = {
	on_attach = function(client, bufnr)
    require("pitoniak32.lsp.default_handlers").default_attach(client, bufnr)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
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

-- local pyright = {
-- 	on_attach = function(default_on_attach)
-- 		return function(client, bufnr)
-- 			default_on_attach(client, bufnr)
-- 		end
-- 	end,
-- }

-- if client.name == "html" or client.name == "jdt.ls" then
--   client.server_capabilities.document_formatting = false
-- end

M = {}

M.servers = {
	tsserver = tsserver,
	sumneko_lua = sumneko_lua,
	-- pyright = pyright,
}

return M
