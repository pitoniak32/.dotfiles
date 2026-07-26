vim.opt_local.formatoptions:remove({
  "a", -- Auto formatting is BAD.
  "t", -- Don't auto format my code. I got linters for that.
  "o", -- O and o, don't continue comments
  "2", -- I'm not in gradeschool anymore
})
vim.opt_local.formatoptions:append({
  "c", -- In general, I like it when comments respect textwidth
  "q", -- Allow formatting comments w/ gq
  "r", -- But do continue when pressing enter.
  "n", -- Indent past the formatlistpat, not underneath it.
  "j", -- Auto-remove comments if possible.
})
