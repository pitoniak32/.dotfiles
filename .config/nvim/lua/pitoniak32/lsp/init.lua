local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local lsp_custom_opts_ok, lsp_custom_opts = pcall(require, "pitoniak32.lsp.custom_server_opts")
if not lsp_custom_opts_ok then
	print("LSP: error when requiring custom options.")
	return
end

local lsp_default_handlers_status_ok, lsp_default_handlers = pcall(require, "pitoniak32.lsp.default_handlers")
if not lsp_default_handlers_status_ok then
	print("LSP: error when requiring default handers.")
	return
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	print("CMP: failed to import cmp_nvim_lsp.")
	return
end

local completion_status_ok, _ = pcall(require, "pitoniak32.completions")
if not completion_status_ok then
	print("CMP: error when requiring completions.")
	return
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities = cmp_nvim_lsp.update_capabilities(updated_capabilities)

-- Table of configured language servers.
local servers = lsp_custom_opts.servers

local setup_server = function(server, server_custom_config)
	lspconfig[server].setup(vim.tbl_deep_extend("force", server_custom_config, {
		on_attach = server_custom_config.on_attach(lsp_default_handlers.default_attach),
		capabilities = updated_capabilities,
	}))
end

-- setup all defined lsps
for server, config in pairs(servers) do
	setup_server(server, config)
end
