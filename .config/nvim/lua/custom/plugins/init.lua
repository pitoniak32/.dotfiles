return {
	"numToStr/Comment.nvim",
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		init = function()
			vim.g.skip_ts_context_commentstring_module = true
		end,
	},
	"mfussenegger/nvim-lint",
}
