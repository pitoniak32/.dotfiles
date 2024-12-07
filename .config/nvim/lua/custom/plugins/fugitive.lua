return {
  "tpope/vim-fugitive",
  enabled = false,
  config = function()
    vim.keymap.set("n", "<leader>gs", "<CMD>vertical G<CR>")
  end,
}
