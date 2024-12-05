return {
  -- Not sure if this is needed
  "mfussenegger/nvim-lint",
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      -- diagnostic
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    init = function()
      require("ts_context_commentstring").setup {
        enable_autocmd = false,
      }
    end,
  },
}
