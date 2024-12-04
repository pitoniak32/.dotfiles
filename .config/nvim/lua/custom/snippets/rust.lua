require("luasnip.session.snippet_collection").clear_snippets "rust"

-- Article on how to write snippets: https://ejmastnak.com/tutorials/vim-latex/luasnip/#hello-world
--[[ local ls = require("luasnip") ]]
--[[ local s = ls.snippet ]]
--[[ local sn = ls.snippet_node ]]
--[[ local t = ls.text_node ]]
--[[ local i = ls.insert_node ]]
--[[ local f = ls.function_node ]]
--[[ local d = ls.dynamic_node ]]
--[[ local fmt = require("luasnip.extras.fmt").fmt ]]
--[[ local fmta = require("luasnip.extras.fmt").fmta ]]
--[[ local rep = require("luasnip.extras").rep ]]

local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("rust", {
  s({ trig = "ar", dscr = "anyhow::Result<()>" }, fmt("anyhow::Result<{}>", { i(1, "()") }, { delimiters = "{}" })),
})
