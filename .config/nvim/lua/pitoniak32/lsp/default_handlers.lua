local icons = require("pitoniak32.icons")
local keymap_utils = require("pitoniak32.keymaps.utils")

local signs = {
  { name = "DiagnosticSignError", text = icons.diagnostics.Error },
  { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
  { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
  { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  -- show signs
  signs = {
    active = signs,
  },
  underline = false,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  -- border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  -- border = "rounded",
})

M = {}

local nnoremap = keymap_utils.nnoremap

M.default_attach = function(client, bufnr)
  if client.server_capabilities.document_highlight then
    local status_ok, illuminate = pcall(require, "illuminate")
    if not status_ok then
      return
    end
    illuminate.on_attach(client)
  end

  -- { "n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", gen_opts},
  nnoremap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { silent = true, buffer = bufnr })
  nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true, buffer = bufnr })
  nnoremap("K", "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true, buffer = bufnr })
  nnoremap("gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", { silent = true, buffer = bufnr })
  nnoremap("gr", "<cmd>lua vim.lsp.buf.references()<CR>", { silent = true, buffer = bufnr })
  nnoremap("<leader>fd", "<cmd>lua vim.diagnostic.open_float()<CR>", { silent = true, buffer = bufnr })
  nnoremap("[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', { silent = true, buffer = bufnr })
  nnoremap("]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', { silent = true, buffer = bufnr })
  nnoremap("gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { silent = true, buffer = bufnr })
  nnoremap("<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true, buffer = bufnr })
  nnoremap("<leader>fm", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", { silent = true, buffer = bufnr })
  -- { "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts },
  -- Set all keymaps for current buffer related to lsp.
end

return M
