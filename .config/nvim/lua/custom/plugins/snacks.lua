return {
  "folke/snacks.nvim",
  opts = {
    gitbrowse = {},
  },
  config = function()
    vim.keymap.set("n", "<leader>gb", require("snacks").git.blame_line)
    vim.keymap.set("n", "<leader>gh", function()
      require("snacks").gitbrowse()
    end)
  end,
}
