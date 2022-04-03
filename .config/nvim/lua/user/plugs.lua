
local packer = require("user.packerinit")

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "ThePrimeagen/harpoon"
  use "rcarriga/nvim-notify"
  use { "michaelb/sniprun", run = "bash ./install.sh" }

  -- Colorschemes
  use "morhetz/gruvbox"
  use 'folke/tokyonight.nvim'

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp"
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  -- use "hrsh7th/cmp-emoji"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "christianchiarulli/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "filipdutescu/renamer.nvim"
  use "simrat39/symbols-outline.nvim"
  use "ray-x/lsp_signature.nvim"
  use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  }
  use "RRethy/vim-illuminate"

  -- Java
  use "mfussenegger/nvim-jdtls"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "nvim-treesitter/playground"
  use "romgrk/nvim-treesitter-context"
  use "mizlan/iswap.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

-- Commented out plugin options

-- use "numToStr/Comment.nvim"
-- use "kyazdani42/nvim-web-devicons"
-- use "kyazdani42/nvim-tree.lua"
-- use "tamago324/lir.nvim"
-- use "akinsho/bufferline.nvim"
-- use "moll/vim-bbye"
-- use "nvim-lualine/lualine.nvim"
-- use "akinsho/toggleterm.nvim"
-- use "ahmedkhalf/project.nvim"
-- use "lewis6991/impatient.nvim"
-- use "lukas-reineke/indent-blankline.nvim"
-- use "goolord/alpha-nvim"
-- use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
-- use "folke/which-key.nvim"
-- use "unblevable/quick-scope"
-- use "phaazon/hop.nvim"
-- use "andymass/vim-matchup"
-- use "nacro90/numb.nvim"
-- use "monaqa/dial.nvim"
-- use "norcalli/nvim-colorizer.lua"
-- use "windwp/nvim-spectre"
-- use "folke/zen-mode.nvim"
-- use "karb94/neoscroll.nvim"
-- use "folke/todo-comments.nvim"
-- use "kevinhwang91/nvim-bqf"
-- use "MattesGroeger/vim-bookmarks"
-- use "lunarvim/vim-solidity"
-- use "Mephistophiles/surround.nvim"
-- use "tpope/vim-repeat"
-- use "Shatur/neovim-session-manager"
-- use "tversteeg/registers.nvim"
-- use "metakirby5/codi.vim"
-- use "nyngwang/NeoZoom.lua"
-- use "SmiteshP/nvim-gps"
-- use {
--  "iamcco/markdown-preview.nvim",
--  run = "cd app && npm install",
--  ft = "markdown",
-- }
-- use "b0o/SchemaStore.nvim"
