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

-- Adding - to what defines a contiguous word
vim.cmd [[set iskeyword+=-]]

-- Transparency
vim.cmd [[highlight Normal ctermbg=none guibg=none]]
vim.cmd [[highlight NormalNC guibg=none]]
vim.cmd [[highlight NvimTreeNormal guibg=none]]
vim.cmd [[highlight NvimTreeNormalNC guibg=none]]
vim.cmd [[highlight SignColumn guibg=none]]
vim.cmd [[highlight TelescopeNormal guibg=none]]
vim.cmd [[highlight TelescopeBorder guibg=none]]

-- Line Number Custom Highlights
vim.cmd [[highlight LineNrAbove ctermfg=11 guifg=#3b4261]]
vim.cmd [[highlight LineNrBelow ctermfg=11 guifg=#3b4261]]
vim.cmd [[highlight LineNr guifg=#96f1ff]]

