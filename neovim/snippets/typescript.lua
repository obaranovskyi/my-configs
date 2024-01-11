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

local rxjsDestroyDeclaration = s(
  "rxjsDestroyDeclaration",
  fmt(
    [[
      private readonly destroySubj = new Subject<void>();
      private destroy$ = new Subject<void>();
    ]],
    {}
  )
)
table.insert(snippets, rxjsDestroyDeclaration)

local rxjsOnDestroy = s(
  "rxjsOnDestroy",
  fmt(
    [[
      ngOnDestroy(): void {{
        this.destroySubj.next();
        this.destroySubj.complete();
      }}
    ]],
    {}
  )
)
table.insert(snippets, rxjsOnDestroy)

return snippets, autosnippets
