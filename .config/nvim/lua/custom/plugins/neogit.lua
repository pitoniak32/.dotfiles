return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local neogit = require "neogit"
    vim.keymap.set("n", "<leader>gs", function()
      neogit.open({ kind = "auto" })
    end)
  end,
}
