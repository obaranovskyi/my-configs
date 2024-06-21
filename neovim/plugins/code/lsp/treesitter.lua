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
			},
			sync_install = false,
			indent = { enable = true },
			-- TODO: This causes issues with syntax highlighting
			-- highlight = { enable = true },
		})
		require("nvim-treesitter.install").compilers = { "clang" }
	end,
}
