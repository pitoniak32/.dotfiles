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
    tag = "0.1.1",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable('make') == 1
        end
      },
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
  "JoosepAlviste/nvim-ts-context-commentstring",
  --[[ "vim-test/vim-test", ]]
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
    init = function()
      vim.g.gitblame_enabled = 0
      vim.g.gitblame_message_template = "<summary> • <date> • <author>"
      vim.g.gitblame_highlight_group = "LineNr"
    end
  },
  "vimwiki/vimwiki",
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
  "j-hui/fidget.nvim",
  "jose-elias-alvarez/null-ls.nvim",
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

  --[[ { ]]
  --[[     "rust-lang/rust.vim", ]]
  --[[     ft = "rust", ]]
  --[[     init = function() ]]
  --[[         vim.g.rustfmt_autosave = 1 ]]
  --[[     end, ]]
  --[[ }, ]]
  -- END Plugins

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
        ensure_installed = { "vimdoc", "bash", "typescript", "javascript", "lua", "rust" },
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
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        ui = {
          -- This option only works in Neovim 0.9
          title = true,
          -- Border type can be single, double, rounded, solid, shadow.
          border = "rounded",
          winblend = 0,
          expand = "",
          collapse = "",
          code_action = "󱠂 ",
          incoming = " ",
          outgoing = " ",
          hover = ' ',
          kind = {},
        },
        lightbulb = {
          enable = false,
        },
      })
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    }
  },
  {
    -- BEGIN lsp-zero
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      -- LSP Support
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

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
})
