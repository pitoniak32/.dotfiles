return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      { "L3MON4D3/LuaSnip", version = "v2.*" },
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()

      local cmp = require "cmp"
      cmp.setup {
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        completion = { completeopt = "menu,menuone,noinsert" },
        mapping = cmp.mapping.preset.insert {
          ["<C-y>"] = cmp.mapping.confirm { select = true },
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-space>"] = cmp.mapping.complete(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<CR>"] = cmp.config.disable,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp", max_item_count = 8 },
          { name = "luasnip", max_item_count = 8 },
          { name = "nvim_lsp_signature_help" },
        }, {
          { name = "path", max_item_count = 8 },
          { name = "buffer", max_item_count = 8 },
        }),
      }
    end,
    init = function()
      local ls = require "luasnip"

      -- TODO: Think about `locally_jumpable`, etc.
      -- Might be nice to send PR to luasnip to use filters instead for these functions ;)

      vim.snippet.expand = ls.lsp_expand

      ---@diagnostic disable-next-line: duplicate-set-field
      vim.snippet.active = function(filter)
        filter = filter or {}
        filter.direction = filter.direction or 1

        if filter.direction == 1 then
          return ls.expand_or_jumpable()
        else
          return ls.jumpable(filter.direction)
        end
      end

      ---@diagnostic disable-next-line: duplicate-set-field
      vim.snippet.jump = function(direction)
        if direction == 1 then
          if ls.expandable() then
            return ls.expand_or_jump()
          else
            return ls.jumpable(1) and ls.jump(1)
          end
        else
          return ls.jumpable(-1) and ls.jump(-1)
        end
      end

      vim.snippet.stop = ls.unlink_current

      -- ================================================
      --      My Configuration
      -- ================================================
      ls.config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI",
        override_builtin = true,
      }

      for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
        loadfile(ft_path)()
      end

      vim.keymap.set({ "i", "s" }, "<c-k>", function()
        return vim.snippet.active { direction = 1 } and vim.snippet.jump(1)
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<c-j>", function()
        return vim.snippet.active { direction = -1 } and vim.snippet.jump(-1)
      end, { silent = true })
    end,
  },
}
