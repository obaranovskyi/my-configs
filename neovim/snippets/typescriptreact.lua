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

local group = vim.api.nvim_create_augroup("React Snippets", { clear = true })
local file_pattern = "*.tsx"

local Component = s(
	"Component",
	fmt(
		[[
    const {componentName} = () => {{

    }}

    export default {componentName};
    ]],
		{
			componentName = i(1, "Component Name..."),
		},
		{ repeat_duplicates = true }
	)
)
table.insert(snippets, Component)

return snippets, autosnippets
