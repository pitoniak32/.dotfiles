local actions = require "telescope.actions"

require("telescope").setup {
  defaults = {
    prompt_prefix = "  ",
    selection_caret = "  ",
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
      },
      n = {
        ["C-d"] = actions.delete_buffer + actions.move_to_top,
        ["<C-h>"] = "which_key",
      },
    },
  },
  pickers = {
    buffers = {
      attach_mappings = function(_, map)
        map("i", "<c-b>", actions.delete_buffer)
        return true
      end,
    },
    find_files = {
      hidden = true,
      file_ignore_patterns = { "node_modules", ".git" },
    },
    git_files = {},
    help_tags = {},
    live_grep = {
      file_ignore_patterns = { "node_modules", ".git" },
      additional_args = function()
        return { "--hidden" }
      end,
    },
    diagnostics = {
      theme = "ivy",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {},
    },
  },
}

require("telescope").load_extension "fzf"
require("telescope").load_extension "harpoon"
require("telescope").load_extension "ui-select"

--[[   { "<leader>s", group = "search", mode = "n" }, ]]
--[[   { "<leader>sh", ":lua require('telescope.builtin').help_tags()<CR>", desc = "search help tags" }, ]]
--[[   { "<leader>sd", ":lua require('telescope.builtin').diagnostics()<CR>", desc = "search all diagnostics" }, ]]
--[[   { "<leader>sb", ":lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", desc = "Fuzzily search in current buffer" }, ]]
local builtin = require "telescope.builtin"

vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.git_files)
vim.keymap.set("n", "<leader>fl", builtin.live_grep)
vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find)

vim.keymap.set("n", "<leader>sh", builtin.help_tags)
vim.keymap.set("n", "<leader>sd", builtin.diagnostics)
