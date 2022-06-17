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
o.signcolumn = "yes"
o.mouse = "nv"
o.showmode = false

-- vimwiki
vim.g.vimwiki_list = { { path = "~/.vimwiki/vimwiki/" } }


-- winbar formatting
o.winbar = "%=%m %f"

-- Adding - to what defines a contiguous word
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set inccommand=split]])

vim.cmd([[let g:test#neovim#term_position="vert botright"]])

-- Transparency
vim.cmd([[highlight Normal ctermbg=none guibg=none]])
vim.cmd([[highlight NormalNC guibg=none]])
vim.cmd([[highlight NvimTreeNormal guibg=none]])
vim.cmd([[highlight NvimTreeNormalNC guibg=none]])
vim.cmd([[highlight SignColumn guibg=none]])
vim.cmd([[highlight TelescopeNormal guibg=none]])
vim.cmd([[highlight TelescopeBorder guibg=none]])

-- Telescope prompt color
vim.cmd([[highlight TelescopePromptPrefix guifg=#96f1ff]])
vim.cmd([[highlight LineNr guifg=#5eacd3]])
vim.cmd([[highlight qfFileName guifg=#aed75f]])
vim.cmd([[highlight TelescopeBorder guifg=#5eacd3]])
