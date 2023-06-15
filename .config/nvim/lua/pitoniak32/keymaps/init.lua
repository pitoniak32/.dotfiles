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

-- Trying out something new here. Using "chords" with a pneumonic 

M = {}

-- Find = <leader> f []
M.key_maps_all = {
  f = {
    name = "find",
    g = { ":lua require('telescope.builtin').git_files({ hidden = true })<CR>", "find git files for project" },
    f = { ":lua require('telescope.builtin').find_files({ hidden = true })<CR>", "find all files in current directory" },
    l = { ":lua require('telescope.builtin').live_grep()<CR>", "find grep string in current project files" },
  },
  s = {
    name = "search",
    h = { ":lua require('telescope.builtin').help_tags()<CR>", "search help tags" },
    d = { ":lua require('telescope.builtin').diagnostics()<CR>", "search all diagnostics" },
    b = { ":lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", "Fuzzily search in current buffer" },
  },
  t = {
    name = "test",
    f = {":TestFile<CR>", "run all tests in the current file" },
    n = {":TestNearest<CR>", "run the nearest test to your cursor" },
    l = {":TestLast<CR>", "rerun the last test that was ran" },
    v = {":TestVisit<CR>", "visit location of last run test" },
  },
  a = {
    name = "action",
    m = { ":lua require'harpoon.mark'.add_file(); vim.notify('harpooned '..vim.fn.expand('%:t'))<CR>", "add mark for current buffer" },
  },
  j = { ":lua require'harpoon.ui'.nav_file(1)<CR>", "open harpooned file 1" },
  k = { ":lua require'harpoon.ui'.nav_file(2)<CR>", "open harpooned file 2" },
  l = { ":lua require'harpoon.ui'.nav_file(3)<CR>", "open harpooned file 3" },
  [";"] = { ":lua require'harpoon.ui'.nav_file(4)<CR>", "open harpooned file 4" },
}

M.key_maps_lsp = {
  a = {
    name = "action",
    r = { ":lua vim.lsp.buf.rename()<CR>", "rename lsp symbol under cursor" },
    f = { ":lua vim.lsp.buf.format({ async = true })<CR>", "format current buffer" },
    c = { ":lua vim.lsp.buf.code_action()<CR>", "code actions" },
  },
  o = {
    name = "open",
    d = {
      "<cmd>lua vim.diagnostic.open_float()<CR>",
      "open diagnostics for symbol under cursor",
    },
    h = { ":lua vim.lsp.buf.hover()<CR>", "open hover info for symbol under cursor" },
    r = { ":lua vim.lsp.buf.references()<CR>", "open references" },
    s = { ":lua vim.lsp.buf.signature_help()<CR>", "open signature help" },
  },
  g = {
    name = "goto",
    d = { ":lua vim.lsp.buf.definition()<CR>", "goto definition" },
    i = { ":lua vim.lsp.buf.implementation()<CR>", "goto implementation" },
    dn = {
      ":lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>",
      "goto diagnostic next",
    },
    dp = {
      ":lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>",
      "goto diagnostic previous",
    },
  },
}

M.options = { prefix = "<leader>", silent = true }

-- pneumoic keybinds end
nnoremap("<C-e>", ":lua require'harpoon.ui'.toggle_quick_menu()<CR>", { desc = "open harpoon menu", silent = true })

--[[ nnoremap("<leader>e", vim.cmd.Lex, gen_opts) ]] -- netrw key bind
nnoremap("<leader>e", ":NvimTreeToggle<CR>", gen_opts)
nnoremap("<leader><leader>x", ":lua require'pitoniak32.globals'.save_and_exec()<CR>", gen_opts)

-- Normal Mode Maps
nnoremap("<C-S-Up>", ":resize -2<CR>", gen_opts)
nnoremap("<C-S-Down>", ":resize +2<CR>", gen_opts)
nnoremap("<C-S-Left>", ":vertical resize +2<CR>", gen_opts)
nnoremap("<C-S-Right>", ":vertical resize -2<CR>", gen_opts)
nnoremap("<leader>q", ":Bdelete<CR>", gen_opts)
nnoremap("<leader>gb", ":GitBlameToggle<CR>", gen_opts)
nnoremap("<leader><leader>mc", ":Gvdiffsplit!<CR>", gen_opts)
nnoremap("<leader>gt", ":diffget //2|diffupdate<CR>", gen_opts)
nnoremap("<leader>gm", ":diffget //3|diffupdate<CR>", gen_opts)
nnoremap("<leader>gs", ":G<CR>", gen_opts)


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

return M
