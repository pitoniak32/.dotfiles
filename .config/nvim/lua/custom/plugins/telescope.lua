return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local actions = require "telescope.actions"
      local builtin = require "telescope.builtin"

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

      vim.keymap.set("n", "<leader>fh", builtin.help_tags)
      vim.keymap.set("n", "<leader>fz", function()
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown { previewer = false })
      end)

      vim.keymap.set("n", "<leader>ff", builtin.find_files)
      vim.keymap.set("n", "<leader>fg", builtin.git_files)
      vim.keymap.set("n", "<leader>fl", builtin.live_grep)
      vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find)

      vim.keymap.set("n", "<leader>sh", builtin.help_tags)
      vim.keymap.set("n", "<leader>sd", builtin.diagnostics)
    end,
  },
}
