require("luasnip.session.snippet_collection").clear_snippets "lua"

local ls = require("luasnip")

ls.add_snippets("lua", {
	ls.parser.parse_snippet("expand", "--expand to this"),
})
