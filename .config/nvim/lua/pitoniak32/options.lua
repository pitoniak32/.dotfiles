local o = vim.opt

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
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
-- o.colorcolumn = "80"
o.signcolumn = "yes"
o.mouse = "nv"
o.showmode = false

-- vim.cmd([["set formatoptions-=cro"]])

-- Adding - to what defines a contiguous word
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set inccommand=split]])

-- formatting on save
require("pitoniak32.format_cmds")

vim.cmd([[let g:test#neovim#term_position="vert botright"]])

-- Transparency
-- vim.cmd([[highlight Normal ctermbg=none guibg=none]])
-- vim.cmd([[highlight NormalNC guibg=none]])
-- vim.cmd([[highlight NvimTreeNormal guibg=none]])
-- vim.cmd([[highlight NvimTreeNormalNC guibg=none]])
vim.cmd([[highlight SignColumn guibg=none]])
-- vim.cmd([[highlight TelescopeNormal guibg=none]])
-- vim.cmd([[highlight TelescopeBorder guibg=none]])

-- Git Gutter Signs Transparency
vim.cmd([[highlight GruvboxRedSign guibg=none]])
vim.cmd([[highlight GruvboxGreenSign guibg=none]])
vim.cmd([[highlight GruvboxRedSign guibg=none]])
vim.cmd([[highlight GruvboxAquaSign guibg=none]])

-- Telescope prompt color
-- vim.cmd([[highlight TelescopePromptPrefix guifg=#96f1ff]])
--
-- vim.cmd([[highlight LineNr guifg=#5eacd3]])
-- vim.cmd([[highlight qfFileName guifg=#aed75f]])
--
-- vim.cmd([[highlight TelescopeBorder guifg=#5eacd3]])
