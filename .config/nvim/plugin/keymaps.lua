local set = vim.keymap.set
local k = vim.keycode

local fn = function(f, ...)
  local args = { ... }
  return function(...)
    return f(unpack(args), ...)
  end
end

set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

-- Toggle hlsearch if it's on, otherwise just do "enter"
set("n", "<CR>", function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.v.hlsearch == 1 then
    vim.cmd.nohl()
    return ""
  else
    return k "<CR>"
  end
end, { expr = true })

-- Normally these are not good mappings, but I have left/right on my thumb
-- cluster, so navigating tabs is quite easy this way.
--[[ set("n", "<left>", "gT") ]]
--[[ set("n", "<right>", "gt") ]]

-- There are builtin keymaps for this now, but I like that it shows
-- the float when I navigate to the error - so I override them.
set("n", "]d", fn(vim.diagnostic.jump, { count = 1, float = true }))
set("n", "[d", fn(vim.diagnostic.jump, { count = -1, float = true }))

-- These mappings control the size of splits (height/width)
set("n", "<M-l>", "<c-w>5<")
set("n", "<M-h>", "<c-w>5>")
set("n", "<M-j>", "<C-W>+")
set("n", "<M-k>", "<C-W>-")

set("n", "<space>tt", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = 0 }, { bufnr = 0 })
end)

-- Search stay in place
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- Keep register value when pasting
set("x", "<leader>p", '"_dP')

-- Keep register value when deleting
set("n", "<leader>d", '"_d')
set("v", "<leader>d", '"_d')

-- System clipboard copy
set("n", "<leader>y", '"*y')
set("v", "<leader>y", '"*y')
set("n", "<leader>Y", '"*Y')

-- Quickfix list
set("n", "<C-j>", "<cmd>cnext<CR>zz")
set("n", "<C-k>", "<cmd>cprev<CR>zz")

--[[ vim.api.nvim_set_keymap("n", "<leader>t", "<Plug>PlenaryTestFile", { noremap = false, silent = false }) ]]

--[[ set("n", "j", function(...) ]]
--[[   local count = vim.v.count ]]
--[[]]
--[[   if count == 0 then ]]
--[[     return "gj" ]]
--[[   else ]]
--[[     return "j" ]]
--[[   end ]]
--[[ end, { expr = true }) ]]

--[[ set("n", "k", function(...) ]]
--[[   local count = vim.v.count ]]
--[[]]
--[[   if count == 0 then ]]
--[[     return "gk" ]]
--[[   else ]]
--[[     return "k" ]]
--[[   end ]]
--[[ end, { expr = true }) ]]

--[[   --[[ { "<leader>t", group = "test", mode = "n" }, ]]
--[[   --[[ { "<leader>tf", ":TestFile<CR>", desc = "run all tests in the current file" }, ]]
--[[   --[[ { "<leader>tn", ":TestNearest<CR>", desc = "run the nearest test to your cursor" }, ]]
--[[   --[[ { "<leader>tl", ":TestLast<CR>", desc = "rerun the last test that was ran" }, ]]
--[[   --[[ { "<leader>tv", ":TestVisit<CR>", desc = "visit location of last run test" }, ]]

--[[ nnoremap("<space>-", ":lua require'oil'.toggle_float()<CR>", gen_opts) ]]

--[[ --[[ nnoremap("<leader>e", vim.cmd.Lex, gen_opts) ]]
-- netrw key bind ]]

--[[ nnoremap("<leader>e", ":NvimTreeToggle<CR>", gen_opts) ]]

--[[ nnoremap("<leader>q", ":Bdelete<CR>", gen_opts) ]]
--[[ nnoremap("<leader><leader>mc", ":Gvdiffsplit!<CR>", gen_opts) ]]
--[[ nnoremap("<leader>gt", ":diffget //2|diffupdate<CR>", gen_opts) ]]
--[[ nnoremap("<leader>gm", ":diffget //3|diffupdate<CR>", gen_opts) ]]
--[[ nnoremap("<leader>gs", ":vertical G<CR>", gen_opts) ]]
--[[]]
--[[]]
--[[ nnoremap("<leader>sp", ":setlocal spell!<CR>", gen_opts) ]]
--[[]]
--[[ -- Shift J cursor stay in place ]]
--[[ nnoremap("J", "mzJ`z", gen_opts) ]]
--[[]]
--[[ -- Jump up and down cursor stay in place ]]
--[[ nnoremap("<C-d>", "<C-d>zz", gen_opts) ]]
--[[ nnoremap("<C-u>", "<C-u>zz", gen_opts) ]]
--[[]]
--[[]]
--[[ -- Move Block ]]
--[[ vnoremap("<", "<gv", gen_opts ) ]]
--[[ vnoremap(">", ">gv", gen_opts ) ]]
--[[ vnoremap("J", ":m '>+1<CR>gv=gv", gen_opts ) ]]
--[[ vnoremap("K", ":m '<-2<CR>gv=gv", gen_opts ) ]]
--[[ xnoremap("J", ":move '>+1<CR>gv=gv", gen_opts ) ]]
--[[ xnoremap("K", ":move '<-2<CR>gv=gv", gen_opts ) ]]
--[[]]
--[[]]
--[[ return M ]]
