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

nnoremap("<leader>ex", vim.cmd.Ex, gen_opts)
nnoremap("<leader><leader>x", ":lua require'pitoniak32.globals'.save_and_exec()<CR>", gen_opts)

-- Normal Mode Maps
nnoremap("<C-S-Up>", ":resize -2<CR>", gen_opts)
nnoremap("<C-S-Down>", ":resize +2<CR>", gen_opts)
nnoremap("<C-S-Left>", ":vertical resize -2<CR>", gen_opts)
nnoremap("<C-S-Right>", ":vertical resize +2<CR>", gen_opts)
nnoremap("<leader>q", ":Bdelete<CR>", gen_opts)
nnoremap("<leader>gb", ":GitBlameToggle<CR>", gen_opts)
nnoremap("<leader><leader>mc", ":Gvdiff<CR>", gen_opts)
nnoremap("<leader><leader>gm", ":diffget //2<CR>", gen_opts)
nnoremap("<leader><leader>gt", ":diffget //3<CR>", gen_opts)
nnoremap("<leader>e", ":NvimTreeToggle <CR>", gen_opts)
nnoremap("<leader>gs", ":G<CR>", gen_opts)
nnoremap("<leader>gf", ":lua require('telescope.builtin').git_files({ hidden = true })<CR>", gen_opts)
nnoremap("<leader>sf", ":lua require('telescope.builtin').find_files({ hidden = true })<CR>", gen_opts)
nnoremap("<leader>sh", ":lua require('telescope.builtin').help_tags()<CR>", gen_opts)
nnoremap("<leader>sg", ":lua require('telescope.builtin').live_grep()<CR>", gen_opts)
nnoremap("<leader>sd", ":lua require('telescope.builtin').diagnostics()<CR>", gen_opts)
nnoremap('<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

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

-- Undo Breakpoints
inoremap(",", ",<c-g>u", gen_opts )
inoremap(".", ".<c-g>u", gen_opts )
inoremap("!", "!<c-g>u", gen_opts )
inoremap("?", "?<c-g>u", gen_opts )

-- Shift J cursor stay in place
nnoremap("J", "mzJ`z", gen_opts)

-- Jump up and down cursor stay in place
nnoremap("<C-d>", "<C-d>zz", gen_opts)
nnoremap("<C-u>", "<C-u>zz", gen_opts)

-- Search stay in place
nnoremap("n", "nzzzv", gen_opts)
nnoremap("N", "Nzzzv", gen_opts)

-- Move Block
vnoremap("<", "<gv", gen_opts )
vnoremap(">", ">gv", gen_opts )
vnoremap("J", ":m '>+1<CR>gv=gv", gen_opts )
vnoremap("K", ":m '<-2<CR>gv=gv", gen_opts )
xnoremap("J", ":move '>+1<CR>gv=gv", gen_opts )
xnoremap("K", ":move '<-2<CR>gv=gv", gen_opts )

-- Keep register value when pasting
xnoremap("<leader>p", "\"_dP", gen_opts)

-- Keep register value when deleting 
nnoremap("<leader>d", "\"_d", gen_opts)
vnoremap("<leader>d", "\"_d", gen_opts)

-- System clipboard copy
nnoremap("<leader>y", "\"*y", gen_opts)
vnoremap("<leader>y", "\"*y", gen_opts)
nnoremap("<leader>Y", "\"*Y", gen_opts)

-- Quickfix list  
nnoremap("<C-j>", "<cmd>cnext<CR>zz", gen_opts)
nnoremap("<C-k>", "<cmd>cprev<CR>zz", gen_opts)
