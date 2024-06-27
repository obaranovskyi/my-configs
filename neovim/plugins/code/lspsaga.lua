-- INFO: I need to investigate this plugin he has many features
-- more here: https://nvimdev.github.io/lspsaga/
return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lspsaga").setup({
			ui = {
				code_action = "",
			},
		})

		vim.keymap.set("n", "<leader>fw", ":Lspsaga outline<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>fa", ":Lspsaga finder<CR>", { noremap = true, silent = true })
		vim.keymap.set({ "n", "v" }, "<leader>fg", ":Lspsaga code_action<CR>", { noremap = true, silent = true })
	end,
}
