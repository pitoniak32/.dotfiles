return {
  {
    "tjdevries/colorbuddy.nvim",
    dependencies = {
      { "catppuccin/nvim", name = "catppuccin" },
      "folke/tokyonight.nvim",
      "navarasu/onedark.nvim",
    },
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-macchiato"
    end,
  },
}
