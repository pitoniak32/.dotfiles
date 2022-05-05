local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

ls.cleanup()

ls.add_snippets("typescript", {
	s("test.each", { t("-- test for each case") }),
})

ls.add_snippets("lua", {
	ls.parser.parse_snippet("expand", "--expand to this"),
})

