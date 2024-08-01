return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	config = function()
		require("chatgpt").setup()

		-- Mappings
		vim.keymap.set({ "n", "v" }, "<leader>cG", function()
			vim.cmd("ChatGPT")
		end, { silent = true })
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-telescope/telescope.nvim",
	},
}
