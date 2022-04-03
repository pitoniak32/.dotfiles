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

vim.cmd [[highlight Normal guibg=none]]
vim.cmd [[set iskeyword+=-]]
