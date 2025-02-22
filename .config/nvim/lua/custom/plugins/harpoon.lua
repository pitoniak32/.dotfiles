return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 110,
    },
  },
  config = function()
    local harpoon = require "harpoon"
    harpoon:setup()

    vim.keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set("n", "<leader>m", function()
      harpoon:list():add()
      -- harpooned o--file-->
      vim.notify("*THWIP!* o--" .. vim.fn.expand "%:t" .. "-->")
    end)

    for idx, key in ipairs { "h", "j", "k", "l", ";", "'" } do
      vim.keymap.set("n", string.format("<leader>%s", key), function()
        harpoon:list():select(idx)
      end)
    end
  end,
}
