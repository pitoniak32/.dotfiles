require("luasnip.session.snippet_collection").clear_snippets "typescript"

local ls = require "luasnip"

-- Temp expriement. Will be improved with luasnip dynamic nodes.
-- TODO: add toggle list for async tests
-- TODO: add snippet for single it statements and reuse it for complex test cases
ls.add_snippets("typescript", {
  ls.parser.parse_snippet(
    "tsuite",
    "describe('${1:sut}', () => {\n  const cases = [[], [], []]\n  test.each(cases)(\n    'should ${2:do the thing}',\n    (\n      ${3:firstArg},\n      ${4:secondArg},\n      expectedResult,\n    ) => {\n      ${0}\n    },\n  )\n})"
  ),
})
