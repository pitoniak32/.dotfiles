
local lsp_zero = require("lsp-zero")
local wk = require("which-key")

lsp_zero.on_attach(function(_, buffnr)
    wk.register(require("pitoniak32.keymaps").key_maps_lsp, { prefix = "<leader>", buffer = buffnr, silent = true })
end)

lsp_zero.preset("recommended")

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "lua_ls", "rust_analyzer", --[[ "tsserver", "eslint", ]] },
    handlers = {
      lsp_zero.default_setup,
      lua_ls = function()
        require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls())
      end,
    }
})

require('lspconfig').tsserver.setup({
    init_options = {
        preferences = {
            importModuleSpecifierPreference = "relative"
        },
    },
})

require('lspconfig').lua_ls.setup({
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
})

lsp_zero.set_preferences({
    suggest_lsp_servers = true,
    setup_servers_on_start = true,
    configure_diagnostics = true,
    manage_nvim_cmp = false,
    sign_icons = {},
})

require("fidget").setup()

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
        ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<c-y>"] = cmp.mapping(
            cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            },
            { "i", "c" }
        ),
        ["<M-y>"] = cmp.mapping(
            cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            },
            { "i", "c" }
        ),

        ["<c-space>"] = cmp.mapping {
            i = cmp.mapping.complete(),
            c = function(
                _ --[[fallback]]
            )
                if cmp.visible() then
                    if not cmp.confirm { select = true } then
                        return
                    end
                else
                    cmp.complete()
                end
            end,
        },
        ["<tab>"] = cmp.config.disable,
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
    },
})


lsp_zero.setup()

vim.diagnostic.config({
    virtual_text = true,
})
