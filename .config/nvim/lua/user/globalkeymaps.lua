local general_keymaps = function()
    local default_opts = { noremap = true, silent = true }
    local general_keymap = vim.api.nvim_set_keymap

    -- Remap leader
    general_keymap("", "<Space>", "<Nop>", default_opts)
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    -- Normal Mode Maps
    general_keymap("n", "<leader>e", ":NvimTreeToggle <CR>", default_opts)

    general_keymap("n", "<C-h>", "<C-w>h", default_opts)
    general_keymap("n", "<C-j>", "<C-w>j", default_opts)
    general_keymap("n", "<C-k>", "<C-w>k", default_opts)
    general_keymap("n", "<C-l>", "<C-w>l", default_opts)

    general_keymap("n", "<C-S-Up>", ":resize -2<CR>", default_opts)
    general_keymap("n", "<C-S-Down>", ":resize +2<CR>", default_opts)
    general_keymap("n", "<C-S-Left>", ":vertical resize -2<CR>", default_opts)
    general_keymap("n", "<C-S-Right>", ":vertical resize +2<CR>", default_opts)

    general_keymap("n", "<S-l>", ":bnext<CR>", default_opts)
    general_keymap("n", "<S-h>", ":bprevious<CR>", default_opts)

    -- Insert Mode Maps
    general_keymap("i", "jj", "<ESC>", default_opts)

    -- Visual Mode Maps
    general_keymap("v", "<", "<gv", default_opts)
    general_keymap("v", ">", ">gv", default_opts)

    general_keymap("v", "p", '"_P', default_opts)

    -- Visual Block Mode Maps
    general_keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)
    general_keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)
end

-- Lsp Maps --
local lsp_keymaps = function(bufnr)
    local lsp_default_opts = { noremap = true, silent = true }
    local lsp_keymap = vim.api.nvim_buf_set_keymap

    lsp_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", lsp_default_opts)
    lsp_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", lsp_default_opts)
    lsp_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", lsp_default_opts)
    lsp_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", lsp_default_opts)
    lsp_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", lsp_default_opts)
    lsp_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", lsp_default_opts)
    lsp_keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", lsp_default_opts)
    lsp_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", lsp_default_opts)
    lsp_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", lsp_default_opts)
    lsp_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', lsp_default_opts)
    lsp_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', lsp_default_opts)
    lsp_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", lsp_default_opts)
    lsp_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", lsp_default_opts)
    -- lsp_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    -- lsp_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    -- lsp_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

return { general_keymaps= general_keymaps, lsp_keymaps=lsp_keymaps }
