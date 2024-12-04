return {
	-- BEGIN lsp-zero
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		-- LSP Support
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"github/copilot.vim",
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			{
				-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
				-- used for completion, annotations and signatures of Neovim apis
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						-- Load luvit types when the `vim.uv` word is found
						{ path = "luvit-meta/library", words = { "vim%.uv" } },
					},
				},
			},

			{ "j-hui/fidget.nvim", opts = {} },
			{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },

			-- Autoformatting
			"stevearc/conform.nvim",

			-- Schema information
			"b0o/SchemaStore.nvim",
		},
		config = function()
			local capabilities = nil
			if pcall(require, "cmp_nvim_lsp") then
				capabilities = require("cmp_nvim_lsp").default_capabilities()
			end

			local lspconfig = require("lspconfig")

			local servers = {
				bashls = true,
				gopls = {
					settings = {
						gopls = {
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
						},
					},
				},
				lua_ls = {
					server_capabilities = {
						semanticTokensProvider = vim.NIL,
					},
				},
				rust_analyzer = true,
				templ = true,
				cssls = true,

				-- Probably want to disable formatting for this lang server
				ts_ls = true,

				jsonls = {
					settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = { enable = true },
						},
					},
				},

				yamlls = {
					settings = {
						yaml = {
							schemaStore = {
								enable = false,
								url = "",
							},
							schemas = require("schemastore").yaml.schemas(),
						},
					},
				},
			}

			local servers_to_install = vim.tbl_filter(function(key)
				local t = servers[key]
				if type(t) == "table" then
					return not t.manual_install
				else
					return t
				end
			end, vim.tbl_keys(servers))

			require("mason").setup()
			local ensure_installed = {
				"stylua",
				"lua_ls",
				-- "tailwind-language-server",
			}

			vim.list_extend(ensure_installed, servers_to_install)
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			for name, config in pairs(servers) do
				if config == true then
					config = {}
				end
				config = vim.tbl_deep_extend("force", {}, {
					capabilities = capabilities,
				}, config)

				lspconfig[name].setup(config)
			end

			local disable_semantic_tokens = {
				lua = true,
			}

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

					--[[ M.key_maps_lsp = { ]]
					--[[   { "<leader>a", group = "action", mode = "n" }, ]]
					--[[   { "<leader>ar", ":lua vim.lsp.buf.rename()<CR>", desc = "rename lsp symbol under cursor" }, ]]
					--[[   { "<leader>af", ":lua vim.lsp.buf.format({ async = true })<CR>", desc = "format current buffer" }, ]]
					--[[   { "<leader>ac", ":lua vim.lsp.buf.code_action()<CR>", desc = "code actions" }, ]]
					--[[]]
					--[[   { "<leader>r", group = "debugger", mode = "n" }, ]]
					--[[   { "<leader>d", "DapToggleBreakpoint<CR>", desc = "Toggle Breakpoint" }, ]]
					--[[   { "<leader>x", "DapTerminate<CR>", desc = "Terminate Dap" }, ]]
					--[[   { "<leader>s", "DapStepOver<CR>", desc = "Step Over" }, ]]
					--[[]]
					--[[   { "<leader>o", group = "open", mode = "n" }, ]]
					--[[   { "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "open diagnostics for symbol under cursor" }, ]]
					--[[   { "<leader>h", ":lua vim.lsp.buf.hover()<CR>", desc = "open hover info for symbol under cursor" }, ]]
					--[[   { "<leader>r", ":lua vim.lsp.buf.references()<CR>", desc = "open references" }, ]]
					--[[   { "<leader>s", ":lua vim.lsp.buf.signature_help()<CR>", desc = "open signature help" }, ]]
					--[[]]
					--[[   { "<leader>g", group = "goto", mode = "n" }, ]]
					--[[   { "<leader>d", ":lua vim.lsp.buf.definition()<CR>", desc = "goto definition" }, ]]
					--[[   { "<leader>i", ":lua vim.lsp.buf.implementation()<CR>", desc = "goto implementation" }, ]]
					--[[   { "<leader>dn", ":lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", desc = "goto diagnostic next", }, ]]
					--[[   { "<leader>dp", ":lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", desc = "goto diagnostic previous", }, ]]
					--[[ } ]]
					vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
					vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0 })
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
					vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })

					vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = 0 })
					vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = 0 })

					local filetype = vim.bo[bufnr].filetype
					if disable_semantic_tokens[filetype] then
						client.server_capabilities.semanticTokensProvider = nil
					end
				end,
			})

			require("custom.autoformat").setup()

			require("lsp_lines").setup()
			vim.diagnostic.config({ virtual_text = true, virtual_lines = false })

			vim.keymap.set("", "<leader>l", function()
				local config = vim.diagnostic.config() or {}
				if config.virtual_text then
					vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
				else
					vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
				end
			end, { desc = "Toggle lsp_lines" })
		end,
	},
}
