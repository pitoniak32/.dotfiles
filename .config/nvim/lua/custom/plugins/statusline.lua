return {
  {
    "tjdevries/express_line.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("custom.statusline").setup()
    end,
  },
}
