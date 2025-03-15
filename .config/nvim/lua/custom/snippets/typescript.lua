require("luasnip.session.snippet_collection").clear_snippets "typescript"

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

-- Temp expriement. Will be improved with luasnip dynamic nodes.
-- TODO: add toggle list for async tests
-- TODO: add snippet for single it statements and reuse it for complex test cases
-- ls.add_snippets("typescript", {
--   ls.parser.parse_snippet(
--     "tsuite",
--     "describe('${1:sut}', () => {\n  const cases = [[], [], []]\n  test.each(cases)(\n    'should ${2:do the thing}',\n    (\n      ${3:firstArg},\n      ${4:secondArg},\n      expectedResult,\n    ) => {\n      ${0}\n    },\n  )\n})"
--   ),
--   ls.parser.parse_snippet(
--     "cdi",
--     "describe('${1:sut}', () => {\n  const cases = [[], [], []]\n  test.each(cases)(\n    'should ${2:do the thing}',\n    (\n      ${3:firstArg},\n      ${4:secondArg},\n      expectedResult,\n    ) => {\n      ${0}\n    },\n  )\n})"
--   ),
-- })

ls.add_snippets("typescript", {
  s(
    { trig = "cdi", dscr = "Snippet for console.dir(<obj>, { depth: Infinity })" },
    fmt( -- The snippet code actually looks like the equation environment it produces.
      [[
        console.dir(<>, { depth = Infinity })
      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1, "null") },
      -- This is where I specify that angle brackets are used as node positions.
      { delimiters = "<>" }
    )
  ),
})
