return {
  -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  build = function()
    pcall(require("nvim-treesitter.install").update { with_sync = true })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/playground",
    "romgrk/nvim-treesitter-context",
  },
  config = function()
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      print "failed to load 'nvim-treesitter.configs'"
      return
    end
    ---@diagnostic disable-next-line: missing-fields
    configs.setup {
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
      sync_install = false,
      auto_install = false,
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
    }
  end,
}
