local lsp_zero = require("lsp-zero")
local wk = require("which-key")

lsp_zero.on_attach(function(_, buffnr)
  wk.add(require("pitoniak32.keymaps").key_maps_lsp, { prefix = "<leader>", buffer = buffnr, silent = true })
end)

lsp_zero.preset("recommended")

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "tsserver",
    "eslint",
    "dockerls",
    "yamlls",
    "nil_ls",
  },
  handlers = {
    lsp_zero.default_setup,
    tsserver = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- https://github.com/neovim/nvim-lspconfig/pull/3232
      require("lspconfig")["ts_ls"].setup({
        capabilities = capabilities,
      })
    end,
    lua_ls = function()
      require("lspconfig").lua_ls.setup({
        on_init = function(client)
          local path = client.workspace_folders[1].name
          if
              not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc")
          then
            client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
              Lua = {
                runtime = {
                  -- Tell the language server which version of Lua you're using
                  -- (most likely LuaJIT in the case of Neovim)
                  version = "LuaJIT",
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                  checkThirdParty = false,
                  library = {
                    vim.env.VIMRUNTIME,
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                  },
                  -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                  -- library = vim.api.nvim_get_runtime_file("", true)
                },
              },
            })

            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
          end
          return true
        end,
      })
    end,
  },
})

require("lspconfig").ts_ls.setup({
  init_options = {
    preferences = {
      importModuleSpecifierPreference = "relative",
    },
  },
})

require('lspconfig').rust_analyzer.setup {
  -- Other Configs ...
  settings = {
    ["rust-analyzer"] = {
     imports = {
          granularity = {
              group = "module",
          },
          prefix = "self",
      },
      cargo = {
          buildScripts = {
              enable = true,
          },
      },
      procMacro = {
          enable = true
      },
      diagnostics = {
        disabled = { "unresolved-proc-macro" },

      },
    },
  }
}

require("lspconfig").lua_ls.setup({
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
    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<c-y>"] = cmp.mapping(
      cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
      { "i", "c" }
    ),
    ["<M-y>"] = cmp.mapping(
      cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      }),
      { "i", "c" }
    ),

    ["<c-space>"] = cmp.mapping({
      i = cmp.mapping.complete(),
      c = function(
        _ --[[fallback]]
      )
        if cmp.visible() then
          if not cmp.confirm({ select = true }) then
            return
          end
        else
          cmp.complete()
        end
      end,
    }),
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
