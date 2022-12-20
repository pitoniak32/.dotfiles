local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		prompt_prefix = "  ",
		selection_caret = "  ",
		mappings = {
			i = {
				["<C-h>"] = "which_key",
			},
			n = {
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
	},
	extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
	},
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("harpoon")
