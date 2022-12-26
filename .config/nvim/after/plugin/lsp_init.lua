local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.set_preferences({
	suggest_lsp_servers = true,
	setup_servers_on_start = true,
	configure_diagnostics = true,
	manage_nvim_cmp = false,
	sign_icons = {},
})

require("fidget").setup()

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"sumneko_lua",
	"rust_analyzer",
})
-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
})

local nnoremap = require("pitoniak32.keymaps.utils").nnoremap

lsp.on_attach(function(_, bufnr)
	nnoremap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { silent = true, buffer = bufnr })
	nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true, buffer = bufnr })
	nnoremap("K", "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true, buffer = bufnr })
	nnoremap("gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", { silent = true, buffer = bufnr })
	nnoremap("gr", "<cmd>lua vim.lsp.buf.references()<CR>", { silent = true, buffer = bufnr })
	nnoremap("<leader>df", "<cmd>lua vim.diagnostic.open_float()<CR>", { silent = true, buffer = bufnr })
	nnoremap("[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', { silent = true, buffer = bufnr })
	nnoremap("]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', { silent = true, buffer = bufnr })
	nnoremap("<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true, buffer = bufnr })
	nnoremap("<leader>fm", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", { silent = true, buffer = bufnr })
	nnoremap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { silent = true, buffer = bufnr })
end)

lsp.nvim_workspace()
lsp.setup()
