return {
	"m4xshen/smartcolumn.nvim",
	config = function()
		require("smartcolumn").setup({
			colorcolumn = "120",
			disabled_filetypes = {
				"NvimTree",
				"lazy",
				"mason",
				"sagafinder",
				"sagaoutline",
				"copilot-chat",
				"markdown",
				"text",
				"dashboard",
				"oil",
			},
		})
	end,
}
