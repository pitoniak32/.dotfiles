local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

-- TODO: add something to installer later
require("lspconfig").motoko.setup {}

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("pitoniak32.lsp.handlers").on_attach,
    capabilities = require("pitoniak32.lsp.handlers").capabilities,
  }

  if server.name == "sumneko_lua" then
    local sumneko_opts = require "pitoniak32.lsp.settings.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  --if server.name == "jsonls" then
    --local jsonls_opts = require "pitoniak32.lsp.settings.jsonls"
    --opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  --end

  server:setup(opts)
end)
