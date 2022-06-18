local colorscheme = "tokyonight"

if colorscheme == "tokyonight" then
  vim.g.tokyonight_style = "night"
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

local hl = function(thing, opts)
  vim.api.nvim_set_hl(0, thing, opts)
end

vim.g.gruvbox_contrast_dark = "hard"
vim.g.tokyonight_transparent_sidebar = true
vim.g.gruvbox_invert_selection = "0"
vim.opt.background = "dark"


hl("SignColumn", { bg = "none" })
hl("ColorColumn", { ctermbg = 0, bg = "#555555" })
hl("CursorLineNR", { bg = "None" })
hl("Normal", { ctermbg = 0, bg = "none" })
hl("NormalNC", { bg = "none" })
hl("LineNr", { fg = "#5eacd3" })

hl("NvimTreeNormal", { bg = "none" })
hl("NvimTreeNormalNC", { bg = "none" })

hl("TelescopeNormal", { bg = "none" })
hl("TelescopeBorder", { fg = "#5eacd3", bg = "none" })
hl("TelescopePromptPrefix", { fg = "#96f1ff" })
