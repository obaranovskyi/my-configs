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

local group = vim.api.nvim_create_augroup("Markdown Snippets", { clear = true })
local file_pattern = "*.md"

local blVariables = s(
  "blVariables",
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
table.insert(snippets, blVariables)

local blHeader = s(
  "blHeader",
  fmt(
    [[
                  {{ html: '{content}', href: '{href}' }},
      <h{header} id="{href}" class="navigation-link">
        {content}
      </h{header}>
    ]],
    {
      header = i(1, "Header"),
      content = i(2, "Enter content..."),
      href = i(3, "Enter href/id...")
    },
    { repeat_duplicates = true }
  )
)
table.insert(snippets, blHeader)

local blWarning = s(
  "blWarning",
  fmt(
    [[
      <div class="warning">
          <div class="warning-image">
              <img src="../../assets/images/warning.svg" alt="">
          </div>
          <div class="warning-content">
            {text}
          </div>
      </div>
    ]],
    {
      text = i(1, "Enter text...")
    }
  )
)

table.insert(snippets, blWarning)

local blImage = s(
  "blImage",
  fmt(
    [[
      <p>
        <img class="dark" src="./markdowns/{image}" alt="">
      </p>
    ]],
    { image = i(1, "Enter images path ...")}
  )
)

table.insert(snippets, blImage)

local blImageLightBorder = s(
  "blImageLightBorder",
  fmt(
    [[
      <p>
        <img class="dark light-border" src="./markdowns/{image}" alt="">
      </p>
    ]],
    { image = i(1, "Enter images path ...")}
  )
)

table.insert(snippets, blImageLightBorder)

local blLink = s(
  "blLink",
  fmt(
    '<a href="{url}" target="_blank">{text}</a>',
    {
      text = i(1, "Text"),
      url = i(2, "Url")
    }
  )
)

table.insert(snippets, blLink)

local mCode = s(
  "mCode",
  fmt(
  [[
  ```{language}
  {code}
  ```
  ]],
  {
    language = i(1, "Language"),
    code = i(2, "Code")
  })
)

table.insert(snippets, mCode)

return snippets, autosnippets
