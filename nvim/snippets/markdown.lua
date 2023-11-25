-- INFO: Documentation
-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#variables

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


local blTocObj = s(
  "blTocObj",
  fmt(
    [[
                  {{ 
                    html: '', 
                    href: '' ,
                    children: [
                    ]
                  }},
    ]],
    {},
    { repeat_duplicates = true }
  )
)
table.insert(snippets, blTocObj)

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


-- INFO: To trigger this snippet
-- 1. Select header(text)
-- 2. Click `Tab`
-- 3. You'll get into INSERT MODE, enter s
-- 4. Then you'll see the suggestion, select it, and lick `Enter`
local blHeaderSelection = s("blHeaderSelection", f(function(_, snip)
    local function capitalizeWords(inputString)
        return inputString:gsub("(%a)([%w_']*)", function(first, rest)
            return first:upper() .. (rest or "")
        end):gsub("(%s+)(%a)([%w_']*)", function(space, first, rest)
            return space .. first:upper() .. (rest or "")
        end)
    end

    local function count(base, pattern)
        return select(2, string.gsub(base, pattern, ""))
    end

    local function trim(str)
       return (str:gsub("^%s*(.-)%s*$", "%1"))
    end

    local function replaceBackticksWithTags(inputString, tag)
        local resultString = string.gsub(inputString, "`(.-)`", "<" .. tag .. ">%1</" .. tag .. ">")
        return resultString
    end

    local function removeCharacters(source, charactersToRemove)
        local pattern = "[" .. charactersToRemove:gsub(".", "%%%0") .. "]"
        local resultString = string.gsub(source, pattern, "")
        return resultString
    end

    local function escapeHtml(inputString)
        local htmlEntities = {
            ["<"] = "&lt;",
            [">"] = "&gt;"
            -- Add more entities as needed
        }

        local escapedString = inputString:gsub("[<>]", function(match)
            return htmlEntities[match]
        end)

        return escapedString
    end


    local res, env = {}, snip.env
    local text = table.concat(env.LS_SELECT_RAW, "")
    local headerType = count(text, '#')

    text = trim(text:gsub("%#", ""))

    --[[ local id = removeCharacters( ]]
    --[[   capitalizeWords(text), ]]
    --[[   "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~ " ]]
    --[[ ) ]]
    print('1', text)
    local id = removeCharacters(text, "`")
    print('2', id)
    id = capitalizeWords(id)

    print('3', id)
    id = removeCharacters(id, "!\"#$%&'()*+,-.—/:;<=>?@[\\]^_`{|}~ ")

    print('4', id)

    text = escapeHtml(text)
    text = replaceBackticksWithTags(text, 'code')

    table.insert(res, "          { html: '" .. text .. "', href: '" .. id .. "' },")
    table.insert(res, '<h' .. headerType .. ' id="' .. id .. '" class="navigation-link">')
    table.insert(res, '  ' .. text)
    table.insert(res, '</h' .. headerType .. '>')
    table.insert(res, '')

    return res
  end, {}
  )
)
table.insert(snippets, blHeaderSelection)



return snippets, autosnippets
