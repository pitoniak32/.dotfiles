-- if vim.g.snippets ~= "luasnip" then
-- 	return
-- end

local luasnip = require("luasnip")
local types = require("luasnip.util.types")

luasnip.config.set_config({
	history = true,
	update_events = "TextChanged,TextChangedI",
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "<-", "Error" } },
			},
		},
	},
})

vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if luasnip.jumpable(-1) then
		luasnip.jump(-1)
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-l>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(1)
	end
end)

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/pitoniak32/luasnip.lua<CR>")
local ls = require("luasnip")

-- local s = ls.snippet
-- local i = ls.insert_node
-- local t = ls.text_node

-- Table of loaded snippets was duplicating entries on restart.
ls.cleanup()

-- Temp expriement. Will be improved with luasnip dynamic nodes.
-- TODO: add toggle list for async tests
-- TODO: add snippet for single it statements and reuse it for complex test cases
ls.add_snippets("typescript", {
	ls.parser.parse_snippet(
		"tsuite",
		"describe('${1:sut}', () => {\n  const cases = [[], [], []]\n  test.each(cases)(\n    'should ${2:do the thing}',\n    (\n      ${3:firstArg},\n      ${4:secondArg},\n      expectedResult,\n    ) => {\n      ${0}\n    },\n  )\n})"
	),
})

ls.add_snippets("", {
	ls.parser.parse_snippet("expand", "--expand to this"),
})
