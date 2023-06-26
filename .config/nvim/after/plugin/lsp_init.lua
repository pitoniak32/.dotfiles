local lsp = require("lsp-zero")

lsp.preset("recommended")

local lspconfig = require('lspconfig')

lspconfig.tsserver.setup({
    init_options = {
        preferences = {
            importModuleSpecifierPreference = "relative"
        },
    },
})

lspconfig.lua_ls.setup({
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

lsp.set_preferences({
    suggest_lsp_servers = true,
    setup_servers_on_start = true,
    configure_diagnostics = true,
    manage_nvim_cmp = false,
    sign_icons = {},
})

require("fidget").setup()

lsp.ensure_installed({
    --[[ "tsserver", ]]
    --[[ "eslint", ]]
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

local wk = require("which-key")

lsp.on_attach(function(_, buffnr)
    wk.register(require("pitoniak32.keymaps").key_maps_lsp, { prefix = "<leader>", buffer = buffnr, silent = true })
end)

lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
