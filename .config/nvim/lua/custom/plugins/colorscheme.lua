return {
  {
    "tjdevries/colorbuddy.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-mocha"
    end,
  },
  { "catppuccin/nvim", name = "catppuccin" },
  "folke/tokyonight.nvim",
  "navarasu/onedark.nvim",
}
