local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end
-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugs.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
  -- Necessary Plugins
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use({'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
	use("ThePrimeagen/harpoon")
	use("tpope/vim-surround")
	use("gruvbox-community/gruvbox")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/nvim-cmp")
	use("onsails/lspkind-nvim")
	use("L3MON4D3/LuaSnip") --snippet engine
	use("saadparwaiz1/cmp_luasnip")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/playground")
	use("romgrk/nvim-treesitter-context")
	use({ "ckipp01/stylua-nvim", run = "cargo install stylua" })

  -- Quality Of Life Enhancements
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("moll/vim-bbye")
	use("tpope/vim-fugitive")
	use("numToStr/Comment.nvim")
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("vim-test/vim-test")
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
  use({ "akinsho/toggleterm.nvim", branch = "main" })
  use("kyazdani42/nvim-tree.lua")
  use("vimwiki/vimwiki")
  use('mfussenegger/nvim-jdtls')

  use("mfussenegger/nvim-dap")
  use("rcarriga/nvim-dap-ui")
  use("theHamsta/nvim-dap-virtual-text")

  -- Visual Enhancements
	use("akinsho/bufferline.nvim")
	use("lewis6991/gitsigns.nvim")
	use("f-person/git-blame.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("folke/tokyonight.nvim")
	use({ "p00f/nvim-ts-rainbow" })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

  -- Questionably Keeping
	use("ray-x/lsp_signature.nvim")
	use("RRethy/vim-illuminate")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
