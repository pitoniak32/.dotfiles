local fn = vim.fn

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use({'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
	use("ThePrimeagen/harpoon")
	use("tpope/vim-surround")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("moll/vim-bbye")
	--[[ use("numToStr/Comment.nvim") ]]
	--use("tpope/vim-fugitive")
	--use("nvim-treesitter/playground")
	--use("romgrk/nvim-treesitter-context")
 --[[  use("JoosepAlviste/nvim-ts-context-commentstring") ]]
 --[[  use("vim-test/vim-test") ]]
	--[[ use("jose-elias-alvarez/null-ls.nvim") ]]
 --[[  use("vimwiki/vimwiki") ]]

  -- Visual Enhancements
	--[[ use("lewis6991/gitsigns.nvim") ]]
	--[[ use("f-person/git-blame.nvim") ]]
	--[[ use("kyazdani42/nvim-web-devicons") ]]
	--[[ use("folke/tokyonight.nvim") ]]
	--[[ use({ "p00f/nvim-ts-rainbow" }) ]]
  
	-- Lsp Zero
	use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
	    -- LSP Support
	    {'neovim/nvim-lspconfig'},
	    {'williamboman/mason.nvim'},
	    {'williamboman/mason-lspconfig.nvim'},

	    -- Autocompletion
	    {'hrsh7th/nvim-cmp'},
	    {'hrsh7th/cmp-buffer'},
	    {'hrsh7th/cmp-path'},
	    {'saadparwaiz1/cmp_luasnip'},
	    {'hrsh7th/cmp-nvim-lsp'},
	    {'hrsh7th/cmp-nvim-lua'},

	    -- Snippets
	    {'L3MON4D3/LuaSnip'},
	    {'rafamadriz/friendly-snippets'},
	  }
	}
  -- End Lsp Zero

  if packer_bootstrap then
    require('packer').sync()
  end
end)
