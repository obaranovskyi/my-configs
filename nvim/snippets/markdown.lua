local ls = require("luasnip")
local s = ls.s
local i = ls.i
local t = ls.t -- text

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}

local group = vim.api.nvim_create_augroup("Markdown Snippets",  { clear = true })
local file_pattern = "*.md"

local variables = s(
  "mVariables",
  t({
    "<script id=\"markdown-variables\">",
    "    window.currMarkdown = {",
    "        tableOfContents: [",
    "            { html: '', href: '' }",
    "        ]",
    "    }",
    "</script>"
  })
)
table.insert(snippets, variables)

local mHeader1 = s(
  "mHeader1", 
  fmt(
    [[ 
      {{ html: '{content}', href: '{href}' }}, 
      <h1 id="{href}" class="navigation-link">
        {content}
      </h1>
    ]],
    { 
      content = i(2, "Enter content..."),
      href = i(1, "Enter href/id...")
    },
    { repeat_duplicates = true }
  )
)
table.insert(snippets, mHeader1)

return snippets, autosnippets
