return {
	"m4xshen/hardtime.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("hardtime").setup({
			enabled = true,

			-- To find what should be disabled:
			-- 1. Open a window that should be disabled
			-- 2. Run `:lua print(vim.bo.filetype)`
			disabled_filetypes = {
				"NvimTree",
				"lazy",
				"mason",
				"sagafinder",
				"sagaoutline",
				"copilot-chat",
				"markdown", -- this is needed to disable navigation in chatgpt markdown content
				"oil",
				"dashboard",
			},
		})
	end,
}
