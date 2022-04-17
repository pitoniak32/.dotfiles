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

local lsp_installer_status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not lsp_installer_status_ok then
	return
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities = cmp_nvim_lsp.update_capabilities(updated_capabilities)

lsp_installer.on_server_ready(function(server)
	local custom_server_opts = lsp_custom_opts.servers[server.name]

	local opts = vim.tbl_deep_extend("force", {
		on_attach = lsp_default_handlers.default_attach,
		capabilities = updated_capabilities,
	}, custom_server_opts or {})

	server:setup(opts)
end)
