local general_default_opts = { noremap = true, silent = true }
local lsp_default_opts = { noremap = true, silent = true }

local general_map = vim.api.nvim_set_keymap
local lsp_keymap = vim.api.nvim_buf_set_keymap

-- Remap leader
general_map("", "<Space>", "<Nop>", general_default_opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local key_maps = {
	general = {
		-- Normal Mode Maps
		{ "n", "<C-h>", "<C-w>h", general_default_opts },
		{ "n", "<C-j>", "<C-w>j", general_default_opts },
		{ "n", "<C-k>", "<C-w>k", general_default_opts },
		{ "n", "<C-l>", "<C-w>l", general_default_opts },

		{ "n", "<C-S-Up>", ":resize -2<CR>", general_default_opts },
		{ "n", "<C-S-Down>", ":resize +2<CR>", general_default_opts },
		{ "n", "<C-S-Left>", ":vertical resize -2<CR>", general_default_opts },
		{ "n", "<C-S-Right>", ":vertical resize +2<CR>", general_default_opts },

		{ "n", "<S-l>", ":bnext<CR>", general_default_opts },
		{ "n", "<S-h>", ":bprevious<CR>", general_default_opts },
		{ "n", "<leader>q", ":Bdelete<CR>", general_default_opts },

		{ "n", "gb", ":GitBlameToggle<CR>", general_default_opts },
		{ "n", "<leader>e", ":NvimTreeToggle <CR>", general_default_opts },

		{ "n", "<leader>ff", ":lua require'telescope.builtin'.find_files()<CR>", general_default_opts },
		{ "n", "<leader>gf", ":lua require'telescope.builtin'.git_files()<CR>", general_default_opts },
		{ "n", "<leader>lg", ":lua require'telescope.builtin'.live_grep()<CR>", general_default_opts },

		-- Visual Mode Maps
		{ "v", "<", "<gv", general_default_opts },
		{ "v", ">", ">gv", general_default_opts },

		{ "v", "p", '"_P', general_default_opts },

		-- Visual Block Mode Maps
		{ "x", "J", ":move '>+1<CR>gv-gv", general_default_opts },
		{ "x", "K", ":move '<-2<CR>gv-gv", general_default_opts },
	},
	-- Add table for nvim-tree
	lsp = {
		-- { "n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", lsp_default_opts },
		{ "n", "<leader>rn", "<cmd>lua require('pitoniak32.rename_prompt').rename()<CR>", lsp_default_opts },
		{ "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", lsp_default_opts },
		{ "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", lsp_default_opts },
		{ "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", lsp_default_opts },
		{ "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", lsp_default_opts },
		{ "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", lsp_default_opts },
		{ "n", "<leader>fd", "<cmd>lua vim.diagnostic.open_float()<CR>", lsp_default_opts },
		{ "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', lsp_default_opts },
		{ "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', lsp_default_opts },
		{ "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", lsp_default_opts },
		{ "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", lsp_default_opts },
		{ "n", "<leader>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", lsp_default_opts },
		-- { "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts },
	},
}

vim.cmd([[cnoreabbrev HR vert bo h]])

local general_keymaps = function()
	for _, value in pairs(key_maps.general) do
		general_map(value[1], value[2], value[3], value[4])
	end
	-- vim.api.nvim_create_autocmd("BuffEnter", { command = "echo 'Hello'" })
end

-- Set the general vim key maps
general_keymaps()

local lsp_keymaps = function(bufnr)
	for _, value in pairs(key_maps.lsp) do
		lsp_keymap(bufnr, value[1], value[2], value[3], value[4])
	end
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

-- Return the keymap function for lsp setup
return { lsp_keymaps = lsp_keymaps }
