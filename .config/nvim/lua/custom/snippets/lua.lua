require("luasnip.session.snippet_collection").clear_snippets "lua"

local ls = require "luasnip"
local s = ls.snippet
--[[ local sn = ls.snippet_node ]]
local t = ls.text_node
--[[ local i = ls.insert_node ]]
--[[ local f = ls.function_node ]]
--[[ local d = ls.dynamic_node ]]
--[[ local fmt = require("luasnip.extras.fmt").fmt ]]
--[[ local fmta = require("luasnip.extras.fmt").fmta ]]
--[[ local rep = require("luasnip.extras").rep ]]

ls.add_snippets("lua", {
  s({ trig = "hi", dscr = "Snippet for Hello, World!" }, t "Hello, World!"),
})
