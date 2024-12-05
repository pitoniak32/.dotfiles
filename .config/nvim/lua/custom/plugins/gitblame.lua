return {
  "f-person/git-blame.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("gitblame").setup {
      --Note how the `gitblame_` prefix is omitted in `setup`
      enabled = false,
      message_template = "<summary> • <date> • <author>",
      highlight_group = "LineNr",
    }
    vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>")
  end,
}
