local colorscheme = "onedark"
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
