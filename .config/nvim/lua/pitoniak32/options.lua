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
o.completeopt = 'menuone,noselect'
o.splitright = true
o.splitbelow = false

-- vimwiki
vim.g.vimwiki_list = { { path = "~/vimwiki/" } }

-- gitblame 
vim.g.gitblame_enabled = 0
vim.g.gitblame_message_template = "<summary> • <date> • <author>"
vim.g.gitblame_highlight_group = "LineNr"

-- winbar formatting
o.winbar = "%=%m %f"

-- netrw settings
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--[[ vim.g.netrw_liststyle = 3 ]]
--[[ vim.g.netrw_banner = 0 ]]
--[[ vim.g.netrw_browse_split = 4 ]]
--[[ vim.g.netrw_winsize = 25 ]]

--[[ vim.api.nvim_create_autocmd({"FileType"}, { ]]
--[[   pattern = {"netrw"}, ]]
--[[   command = "set nolist" ]]
--[[ }) ]]

-- Adding - to what defines a contiguous word
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set inccommand=split]])

vim.cmd([[let g:test#neovim#term_position="vert botright"]])

