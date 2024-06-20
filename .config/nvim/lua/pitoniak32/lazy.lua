local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "folke/which-key.nvim",
    config = function()
      local keyconfig = require('pitoniak32.keymaps')
      require('which-key').register(keyconfig.key_maps_all, keyconfig.options)
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      "nvim-telescope/telescope-ui-select.nvim",
    },
  },
  {
    "ThePrimeagen/harpoon",
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 110,
      },
    },
  },
  "tpope/vim-surround",
  "tpope/vim-fugitive",
  "numToStr/Comment.nvim",
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    init = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
  },
  {
    "klen/nvim-test",
    init = function()
      require('nvim-test').setup({
        termOpts = {
          width = 132,
          go_back = false,
        },
      })
    end
  },
  "folke/tokyonight.nvim",
  { "catppuccin/nvim", name = "catppuccin" },
  "navarasu/onedark.nvim",
  "p00f/nvim-ts-rainbow",
  {
    "f-person/git-blame.nvim",
    opts = {
      enabled = false,
      message_template = "<summary> • <date> • <author>",
      highlight_group = "LineNr",
    }
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = false,
        theme = 'dracula',
        component_separators = "",
        section_separators = "",
      },
    },
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
  "mfussenegger/nvim-lint",
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
    opts = {
      renderer = {
        icons = {
          glyphs = {
            git = {
              ignored = "I",
            },
          },
        },
      },
      git = {
        ignore = false,
      },
    },
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup {
        columns = { "icon" },
        keymaps = {
          ["<C-h>"] = false,
          ["<M-h>"] = "actions.select_split",
        },
        view_options = {
          show_hidden = true,
        },
      }

      -- Open parent directory in floating window
      vim.keymap.set("n", "<space>-", require("oil").toggle_float)
    end,
  },
  -- BEGIN Treesitter
  {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    build = function()
      pcall(require('nvim-treesitter.install').update({ with_sync = true }))
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/playground",
      "romgrk/nvim-treesitter-context",
    },
    config = function()
      local status_ok, configs = pcall(require, "nvim-treesitter.configs")
      if not status_ok then
        return
      end

      configs.setup({
        ensure_installed = { "vimdoc", "bash", "typescript", "javascript", "lua", "rust", "nix" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        autotag = {
          enable = true,
          disable = { "xml" },
        },
        rainbow = {
          enable = true,
          colors = {
            "Gold",
            "Orchid",
            "DodgerBlue",
            "Salmon",
          },
          disable = { "html" },
        },
        playground = {
          enable = true,
        },
      })
    end
  },
  -- END Treesitter
  {
    -- BEGIN lsp-zero
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      -- LSP Support
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "github/copilot.vim",

      -- Autocompletion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",

      -- Snippets
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap"
    }
  },
})
