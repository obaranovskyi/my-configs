return {
	"MeanderingProgrammer/markdown.nvim",
	name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
	-- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
		"jghauser/follow-md-links.nvim", -- Hit enter to follow markdown link
	}, -- if you prefer nvim-web-devicons
	config = function()
		require("render-markdown").setup({
			code = {
				-- Turn on / off code block & inline code rendering
				enabled = true,
				-- Determines how code blocks & inline code are rendered:
				--  none: disables all rendering
				--  normal: adds highlight group to code blocks & inline code
				--  language: adds language icon to sign column and icon + name above code blocks
				--  full: normal + language
				style = "full",
				-- Highlight for code blocks & inline code
				highlight = "", -- no styling
			},
		})
	end,
}
