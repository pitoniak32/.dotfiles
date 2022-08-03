local map_util = require ('pitoniak32.keymaps.utils')

local gen_opts =  map_util.gen_opts
local leader_map = map_util.leader_map
local nnoremap = map_util.nnoremap
local inoremap = map_util.inoremap
local vnoremap = map_util.vnoremap
local xnoremap = map_util.xnoremap

-- Remap leader
leader_map("<Space>", "<Nop>", gen_opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

nnoremap("<leader><leader>x", ":lua require'pitoniak32.globals'.save_and_exec()<CR>", gen_opts)

-- Normal Mode Maps
nnoremap("<C-S-Up>", ":resize -2<CR>", gen_opts)
nnoremap("<C-S-Down>", ":resize +2<CR>", gen_opts)
nnoremap("<C-S-Left>", ":vertical resize -2<CR>", gen_opts)
nnoremap("<C-S-Right>", ":vertical resize +2<CR>", gen_opts)
nnoremap("<leader>q", ":Bdelete<CR>", gen_opts)
nnoremap("<leader>gb", ":GitBlameToggle<CR>", gen_opts)
nnoremap("<leader>e", ":NvimTreeToggle <CR>", gen_opts)
nnoremap("<leader>gs", ":G<CR>", gen_opts)
nnoremap("<leader>gj", ":diffget //3<CR>", gen_opts)
nnoremap("<leader>gf", ":diffget //2<CR>", gen_opts)
nnoremap("<leader>ff", ":lua require'telescope.builtin'.find_files({ hidden = true })<CR>", gen_opts)
nnoremap("<leader>gf", ":lua require'telescope.builtin'.git_files()<CR>", gen_opts)
nnoremap("<leader><leader>lg", ":lua require'telescope.builtin'.live_grep()<CR>", gen_opts)
nnoremap("<leader>a", ":lua require'harpoon.mark'.add_file(); vim.notify('harpooned '..vim.fn.expand('%:t'))<CR>", gen_opts)
nnoremap("<C-e>", ":lua require'harpoon.ui'.toggle_quick_menu()<CR>", gen_opts)
nnoremap("<leader>j", ":lua require'harpoon.ui'.nav_file(1)<CR>", gen_opts)
nnoremap("<leader>k", ":lua require'harpoon.ui'.nav_file(2)<CR>", gen_opts)
nnoremap("<leader>l", ":lua require'harpoon.ui'.nav_file(3)<CR>", gen_opts)
nnoremap("<leader>;", ":lua require'harpoon.ui'.nav_file(4)<CR>", gen_opts)
nnoremap("<leader>tn", ":TestNearest -strategy=neovim<CR>", gen_opts)
nnoremap("<leader>tl", ":TestLast -strategy=neovim<CR>", gen_opts)
nnoremap("<leader>tv", ":TestVisit<CR>", gen_opts)
nnoremap("<leader>sp", ":setlocal spell!<CR>", gen_opts)

-- Move line
inoremap("<C-k>", "<ESC>:m .-2<CR>==", gen_opts)
inoremap("<C-j>", "<ESC>:m .+1<CR>==", gen_opts)

-- Undo Breakpoints
inoremap(",", ",<c-g>u", gen_opts )
inoremap(".", ".<c-g>u", gen_opts )
inoremap("!", "!<c-g>u", gen_opts )
inoremap("?", "?<c-g>u", gen_opts )

-- Visual Mode Maps
vnoremap("<", "<gv", gen_opts )
vnoremap(">", ">gv", gen_opts )

-- Move Block
vnoremap("J", ":m '>+1<CR>gv=gv", gen_opts )
vnoremap("K", ":m '<-2<CR>gv=gv", gen_opts )

-- Visual Block Mode Maps
xnoremap("J", ":move '>+1<CR>gv-gv", gen_opts )
xnoremap("K", ":move '<-2<CR>gv-gv", gen_opts )
