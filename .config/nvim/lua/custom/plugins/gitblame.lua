return {
	"f-person/git-blame.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local status_ok, comment = pcall(require, "Comment")
		if not status_ok then
			return
		end

		require("nvim-treesitter.configs").setup({
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		})

		comment.setup({
			pre_hook = function(ctx)
				local U = require("Comment.utils")

				local location = nil
				if ctx.ctype == U.ctype.block then
					location = require("ts_context_commentstring.utils").get_cursor_location()
				elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
					location = require("ts_context_commentstring.utils").get_visual_start_location()
				end

				return require("ts_context_commentstring.internal").calculate_commentstring({
					key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
					location = location,
				})
			end,
		})

		require("gitblame").setup({
			--Note how the `gitblame_` prefix is omitted in `setup`
			enabled = false,
			message_template = "<summary> • <date> • <author>",
			highlight_group = "LineNr",
		})
		vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>")
	end,
}
