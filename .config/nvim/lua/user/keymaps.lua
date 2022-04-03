local default_opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", default_opts)
vim.g.leader = " "
vim.g.maplocalleader = " "

-- Normal Mode Maps --

keymap("n", "<C-h>", "<C-w>h", default_opts)
keymap("n", "<C-j>", "<C-w>j", default_opts)
keymap("n", "<C-k>", "<C-w>k", default_opts)
keymap("n", "<C-l>", "<C-w>l", default_opts)

keymap("n", "<leader>e", ":Lex 30<CR>", default_opts)


keymap("n", "<C-S-Up>", ":resize -2<CR>", default_opts)
keymap("n", "<C-S-Down>", ":resize +2<CR>", default_opts)
keymap("n", "<C-S-Left>", ":vertical resize -2<CR>", default_opts)
keymap("n", "<C-S-Right>", ":vertical resize +2<CR>", default_opts)

keymap("n", "<S-l>", ":bnext<CR>", default_opts)
keymap("n", "<S-h>", ":bprevious<CR>", default_opts)

-- End Normal Mode Maps --


-- Insert Mode Maps --

keymap("i", "jj", "<ESC>", default_opts)

-- End Insert Mode Maps --


-- Visual Mode Maps --

keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

keymap("v", "p", '"_P', default_opts)

-- End Visual Mode Maps --


-- Visual Block Mode Maps --

keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)

-- End Visual Block Mode Maps --
