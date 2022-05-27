require("harpoon").setup({
  menu = {
    width = vim.api.nvim_win_get_width(0) - 160,
  },
	projects = {
		-- Yes $HOME works
		["$HOME/.dotfiles/.config/nvim"] = {
			tmux = {
				cmds = {
					"ls -la",
				},
			},
		},
	},
})
