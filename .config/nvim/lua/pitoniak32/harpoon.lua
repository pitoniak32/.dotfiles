require("harpoon").setup({
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
