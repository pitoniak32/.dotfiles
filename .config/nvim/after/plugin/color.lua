local colorscheme = "catppuccin-mocha"
local transparent = false

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

local hl = function(thing, opts)
  vim.api.nvim_set_hl(0, thing, opts)
end

if colorscheme == "tokyonight" then
  vim.g.tokyonight_style = "night"
  if transparent then
    vim.g.tokyonight_transparent_sidebar = true
  end
end

if transparent then
  hl("Normal", { bg = "none" })
  hl("NormalNC", { bg = "none" })
  hl("NonText", { bg = "none" })
  hl("NormalFloat", { bg = "none" })
  hl("NvimTreeNormal", { bg = "none" })
  hl("NvimTreeWinSeparator", { fg = "#303446", bg = "none" })
  hl("TelescopeBorder", { fg = "#8caaee" })
else
  hl("TelescopeBorder", { fg = "#8caaee", bg = "#292c3c" })
end

hl("TelescopeSelectionCaret", { fg = "#56b6c2" })
hl("TelescopePromptPrefix", { fg = "#56b6c2" })
