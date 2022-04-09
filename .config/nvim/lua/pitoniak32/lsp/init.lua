local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "pitoniak32.lsp.lsp-signature"
require "pitoniak32.lsp.lsp-installer"
require("pitoniak32.lsp.handlers").setup()
