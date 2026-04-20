return {
	"m4xshen/hardtime.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("hardtime").setup({
			-- I disabled this because I some commands show noice popup because
			-- hartimes overrides the some commands like `:NvimTreeToggle` (<C-n>)
			enabled = false,

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
				"help",
			},
		})
	end,
}
