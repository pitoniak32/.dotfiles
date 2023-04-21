local fn = vim.fn

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	-- Packer Plugin
	use({ "wbthomason/packer.nvim" })
	-- Packer Plugin
  --
  use({"folke/which-key.nvim"})

	-- BEGIN Plugins

	use({ "nvim-lua/plenary.nvim" }) -- dependency for plugins with async jobs

	use({ "moll/vim-bbye" }) -- close files without closing vim

	use({ "nvim-telescope/telescope.nvim" }) -- best plugin ever
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- speed
	use({ "ThePrimeagen/harpoon" }) -- best plugin ever

	use({ "tpope/vim-surround" })
	use({ "tpope/vim-fugitive" })

	use({ "numToStr/Comment.nvim" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })

	use("vim-test/vim-test")

	use({ "folke/tokyonight.nvim" }) -- very nice theme
  use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "navarasu/onedark.nvim" }) -- Theme inspired by Atom
	use({ "p00f/nvim-ts-rainbow" }) -- rainbow braces
	use({ "f-person/git-blame.nvim" })
	use({ "vimwiki/vimwiki" })
	use({ "nvim-lualine/lualine.nvim" }) -- fancier statusline
	use({ "j-hui/fidget.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- linting / formatting

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
    config = function()
      require("nvim-tree").setup {}
    end
  }

	-- END Plugins

	-- BEGIN Treesitter
	use({ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		run = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	})
	use({ -- Additional text objects via treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	})
	use({ "romgrk/nvim-treesitter-context" })
	use({ "nvim-treesitter/playground" })
	-- END Treesitter

	use({ -- BEGIN lsp-zero
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	}) -- End lsp-zero

	if packer_bootstrap then
		require("packer").sync()
	end
end)
