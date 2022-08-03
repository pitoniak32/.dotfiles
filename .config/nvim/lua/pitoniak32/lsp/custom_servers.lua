M = {}

M.servers = {
	tsserver = {
    on_attach = function(client, bufnr)
      require("pitoniak32.lsp.default_handlers").default_attach(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end,
    init_options = {
      preferences = {
        importModuleSpecifierPreference = "relative"
      },
    },
  },
	sumneko_lua = {
    on_attach = function(client, bufnr)
      require("pitoniak32.lsp.default_handlers").default_attach(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
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
  },
	pyright = {},
  gopls = {},
  zls = {},
}

return M
