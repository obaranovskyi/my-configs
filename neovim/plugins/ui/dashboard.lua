-- INFO: Under construction
return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			header = {},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
