return {
  -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup {
      ensure_installed = {
        "community",
        -- programming
        "typescript",
        "javascript",
        "lua",
        "rust",
        "go",
        -- other
        "templ",
        "bash",
        "just",
        "markdown",
        "markdown_inline",
        "nix",
        "json",
        "yaml",
        "vimdoc",
        "hcl",
      }
    }
  end,
}
