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
o.mouse = "a"
o.showmode = false
o.completeopt = 'menuone,noselect'
o.splitright = true
o.splitbelow = false
o.gdefault = true

o.formatoptions = o.formatoptions
    - "a" -- Auto formatting is BAD.
    - "t" -- Don't auto format my code. I got linters for that.
    - "o" -- O and o, don't continue comments
    - "2" -- I'm not in gradeschool anymore
    + "c" -- In general, I like it when comments respect textwidth
    + "q" -- Allow formatting comments w/ gq
    + "r" -- But do continue when pressing enter.
    + "n" -- Indent past the formatlistpat, not underneath it.
    + "j" -- Auto-remove comments if possible.

-- which_key
o.timeout = true
o.timeoutlen = 300

-- vimwiki
vim.g.vimwiki_list = { { path = "~/vimwiki/" } }

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
