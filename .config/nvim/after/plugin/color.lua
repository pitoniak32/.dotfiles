local colorscheme = "tokyonight"

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
  vim.g.tokyonight_transparent_sidebar = true
end

if colorscheme == 'gruvbox' then
  vim.g.gruvbox_contrast_dark = "hard"
  vim.g.gruvbox_invert_selection = "0"

  hl("GruvboxAquaSign",  { ctermfg = 108, ctermbg = 237, fg = "#8ec07c", bg = "NONE" })
  hl("GruvboxRedSign",   { ctermfg = 167, ctermbg = 237, fg = "#fb4934", bg = "NONE" })
  hl("GruvboxGreenSign", { ctermfg = 142, ctermbg = 237, fg = "#b8bb26", bg = "NONE" })
  hl("GruvboxBlueSign",  { ctermfg = 109, ctermbg = 237, fg = "#83a598", bg = "NONE" })
end


hl("SignColumn",   { fg = "fg", bg = "NONE" })
hl("CursorLineNR", { fg = "fg", bg = "NONE" })
hl("Normal",       { fg = "fg", bg = "NONE" })
hl("NormalNC",     { fg = "fg", bg = "NONE" })
hl("LineNr",       { fg = "#5eacd3" })

hl("NvimTreeNormal",   { bg = "None" })
hl("NvimTreeNormalNC", { bg = "None" })

hl("TelescopeNormal",       { bg = "None" })
hl("TelescopeBorder",       { fg = "#5eacd3", bg = "None" })
hl("TelescopePromptPrefix", { fg = "#96f1ff" })
