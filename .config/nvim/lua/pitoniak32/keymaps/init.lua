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
  { "<leader>f", group = "find", mode = "n" },
  { "<leader>ff", ":lua require('telescope.builtin').find_files({ hidden = true })<CR>", desc = "find all files in current directory" },
  { "<leader>fg", ":lua require('telescope.builtin').git_files({ hidden = true })<CR>", desc = "find git files for project" },
  { "<leader>fl", ":lua require('telescope.builtin').live_grep()<CR>", desc = "find grep string in current project files" },

  { "<leader>s", group = "search", mode = "n" },
  { "<leader>sh", ":lua require('telescope.builtin').help_tags()<CR>", desc = "search help tags" },
  { "<leader>sd", ":lua require('telescope.builtin').diagnostics()<CR>", desc = "search all diagnostics" },
  { "<leader>sb", ":lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", desc = "Fuzzily search in current buffer" },

  { "<leader>t", group = "test", mode = "n" },
  { "<leader>tf", ":TestFile<CR>", desc = "run all tests in the current file" },
  { "<leader>tn", ":TestNearest<CR>", desc = "run the nearest test to your cursor" },
  { "<leader>tl", ":TestLast<CR>", desc = "rerun the last test that was ran" },
  { "<leader>tv", ":TestVisit<CR>", desc = "visit location of last run test" },

  { "<leader>a", group = "action", mode = "n" },
  { "<leader>m", ":lua require'harpoon.mark'.add_file(); vim.notify('harpooned '..vim.fn.expand('%:t'))<CR>", desc = "add mark for current buffer" },

  { "<leader>j", ":lua require'harpoon.ui'.nav_file(1)<CR>", desc = "open harpooned file 1", mode = "n" },
  { "<leader>k", ":lua require'harpoon.ui'.nav_file(2)<CR>", desc = "open harpooned file 2", mode = "n" },
  { "<leader>l", ":lua require'harpoon.ui'.nav_file(3)<CR>", desc = "open harpooned file 3", mode = "n" },
  { "<leader>;", ":lua require'harpoon.ui'.nav_file(4)<CR>", desc = "open harpooned file 4", mode = "n" },
}

M.key_maps_lsp = {
  { "<leader>a", group = "action", mode = "n" },
  { "<leader>ar", ":lua vim.lsp.buf.rename()<CR>", desc = "rename lsp symbol under cursor" },
  { "<leader>af", ":lua vim.lsp.buf.format({ async = true })<CR>", desc = "format current buffer" },
  { "<leader>ac", ":lua vim.lsp.buf.code_action()<CR>", desc = "code actions" },

  { "<leader>r", group = "debugger", mode = "n" },
  { "<leader>d", "DapToggleBreakpoint<CR>", desc = "Toggle Breakpoint" },
  { "<leader>x", "DapTerminate<CR>", desc = "Terminate Dap" },
  { "<leader>s", "DapStepOver<CR>", desc = "Step Over" },

  { "<leader>o", group = "open", mode = "n" },
  { "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "open diagnostics for symbol under cursor" },
  { "<leader>h", ":lua vim.lsp.buf.hover()<CR>", desc = "open hover info for symbol under cursor" },
  { "<leader>r", ":lua vim.lsp.buf.references()<CR>", desc = "open references" },
  { "<leader>s", ":lua vim.lsp.buf.signature_help()<CR>", desc = "open signature help" },

  { "<leader>g", group = "goto", mode = "n" },
  { "<leader>d", ":lua vim.lsp.buf.definition()<CR>", desc = "goto definition" },
  { "<leader>i", ":lua vim.lsp.buf.implementation()<CR>", desc = "goto implementation" },
  { "<leader>dn", ":lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", desc = "goto diagnostic next", },
  { "<leader>dp", ":lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", desc = "goto diagnostic previous", },
}

nnoremap("<space>-", ":lua require'oil'.toggle_float()<CR>", gen_opts)

-- pneumoic keybinds end
nnoremap("<C-e>", ":lua require'harpoon.ui'.toggle_quick_menu()<CR>", { desc = "open harpoon menu", silent = true })

--[[ nnoremap("<leader>e", vim.cmd.Lex, gen_opts) ]] -- netrw key bind
nnoremap("<leader>e", ":NvimTreeToggle<CR>", gen_opts)
nnoremap("<leader><leader>x", ":lua require'pitoniak32.globals'.save_and_exec()<CR>", gen_opts)

-- Normal Mode Maps
nnoremap("<M-l>", "<c-w>5<", gen_opts)
nnoremap("<M-h>", "<c-w>5>", gen_opts)
nnoremap("<M-j>", "<C-W>+", gen_opts)
nnoremap("<M-k>", "<C-W>-", gen_opts)
nnoremap("<leader>q", ":Bdelete<CR>", gen_opts)
nnoremap("<leader>gb", ":GitBlameToggle<CR>", gen_opts)
nnoremap("<leader><leader>mc", ":Gvdiffsplit!<CR>", gen_opts)
nnoremap("<leader>gt", ":diffget //2|diffupdate<CR>", gen_opts)
nnoremap("<leader>gm", ":diffget //3|diffupdate<CR>", gen_opts)
nnoremap("<leader>gs", ":vertical G<CR>", gen_opts)


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
