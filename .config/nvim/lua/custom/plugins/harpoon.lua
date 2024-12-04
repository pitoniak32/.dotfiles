return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	opts = {
		menu = {
			width = vim.api.nvim_win_get_width(0) - 110,
		},
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>m", function()
			harpoon:list():add()
			vim.notify("harpooned " .. vim.fn.expand("%:t"))
		end)

		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		for _, idx in ipairs({ 1, 2, 3, 4, 5 }) do
			vim.keymap.set("n", string.format("<space>%d", idx), function()
				harpoon:list():select(idx)
			end)
		end
	end,
}
