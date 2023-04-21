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
	"lua_ls",
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

local wk = require("which-key")

lsp.on_attach(function(_, buffnr)
	wk.register({
		a = {
			name = "action",
			r = { ":lua vim.lsp.buf.rename()<CR>", "rename lsp symbol under cursor" },
			f = { ":lua vim.lsp.buf.format({ async = true })<CR>", "format current buffer" },
		},
		o = {
			name = "open",
			d = {
				"<cmd>lua vim.diagnostic.open_float()<CR>",
				"open diagnostics for symbol under cursor",
			},
			h = { ":lua vim.lsp.buf.hover()<CR>", "open hover info for symbol under cursor" },
			r = { ":lua vim.lsp.buf.references()<CR>", "open references" },
			s = { ":lua vim.lsp.buf.signature_help()<CR>", "open signature help" },
			c = { ":lua vim.lsp.buf.code_action()<CR>", "open code actions" },
		},
		g = {
			name = "goto",
			d = { ":lua vim.lsp.buf.definition()<CR>", "goto definition" },
			i = { ":lua vim.lsp.buf.implementation()<CR>", "goto implementation" },
			dn = {
				":lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>",
				"goto diagnostic next",
			},
			dp = {
				":lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>",
				"goto diagnostic previous",
			},
		},
	}, { prefix = "<leader>", buffer = buffnr, silent = true })
end)

lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
