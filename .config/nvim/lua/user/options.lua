local o = vim.opt

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.relativenumber = true
o.nu = true
o.wrap = false
o.hidden = true
o.swapfile = false
o.backup = false
o.undofile = true
o.incsearch = true
o.hlsearch = false
o.errorbells = false
o.termguicolors = true
o.scrolloff = 8
o.updatetime = 50
o.colorcolumn = "80"
o.signcolumn = "yes"

o.mouse="nv"

-- Transparency -- 
vim.cmd [[highlight Normal ctermbg=none guibg=none]]
vim.cmd [[highlight NormalNC guibg=none]]
vim.cmd [[highlight NvimTreeNormal guibg=none]]
vim.cmd [[highlight NvimTreeNormalNC guibg=none]]
vim.cmd [[highlight SignColumn guibg=none]]
vim.cmd [[highlight TelescopeNormal guibg=none]]
vim.cmd [[highlight TelescopeBorder guibg=none]]
vim.cmd [[highlight BufferLineFill guibg=none]]


vim.cmd [[set iskeyword+=-]]
