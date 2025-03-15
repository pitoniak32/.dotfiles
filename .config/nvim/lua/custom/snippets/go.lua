require("luasnip.session.snippet_collection").clear_snippets "go"

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

ls.add_snippets("go", {
  s(
    { trig = "ier", dscr = "Snippet for 'if err != nil'" },
    fmt( -- The snippet code actually looks like the equation environment it produces.
      [[
        if err != nil {
          return <>
        }
      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1, "err") },
      -- This is where I specify that angle brackets are used as node positions.
      { delimiters = "<>" }
    )
  ),
})
