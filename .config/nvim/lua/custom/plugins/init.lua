return {
  -- Not sure if this is needed
  "mfussenegger/nvim-lint",
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      -- Have an issue open to see if this can get updated: https://github.com/numToStr/Comment.nvim/issues/498
      ---@diagnostic disable-next-line: missing-fields
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
