return {
  "folke/snacks.nvim",
  opts = {
    gitbrowse = {},
  },
  config = function()
    vim.keymap.set("n", "<leader>gb", function()
      require("snacks").git.blame_line()
    end)
    vim.keymap.set("n", "<leader>gh", function()
      require("snacks").gitbrowse()
    end)
  end,
}
