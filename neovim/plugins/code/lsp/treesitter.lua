return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"python",
				"lua",
				"vim",
				"vimdoc",
				"heex",
				"javascript",
				"typescript",
				"bash",
				"html",
				"css",
				"scss",
				"tsx",
				"c_sharp",
				"sql",
			},
			sync_install = false,
			indent = { enable = true },
			highlight = { enable = true },
		})
	end,
}
