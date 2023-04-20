local colorscheme = "catppuccin-frappe"
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

hl("TelescopeBorder", { fg = "#8caaee", bg = "#292c3c" })
hl("TelescopeSelectionCaret", { fg = "#56b6c2" })
hl("TelescopePromptPrefix", { fg = "#56b6c2" })
