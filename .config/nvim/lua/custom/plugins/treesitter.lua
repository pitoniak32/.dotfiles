return {
  -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
  },
  config = function()
    require("nvim-treesitter").setup {
      ensure_installed = {
        -- programming
        "typescript",
        "javascript",
        "lua",
        "rust",
        "go",
        -- other
        "bash",
        "just",
        "markdown",
        "markdown_inline",
        "nix",
        "json",
        "yaml",
        "vimdoc",
        "hcl",
      },
      auto_install = false,
    }
  end,
}
