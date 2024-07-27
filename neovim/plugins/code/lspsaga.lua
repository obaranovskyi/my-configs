-- INFO: I need to investigate this plugin he has many features
-- more here: https://nvimdev.github.io/lspsaga/
-- default config: https://github.dev/nvimdev/lspsaga.nvim
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
			outline = {
				win_position = "right",
				win_width = 30,
				keys = {
					jump = "<CR>",
				},
			},
			finder = {
				keys = {
					toggle_or_open = "<CR>",
				},
			},
			floaterm = {
				width = 0.9,
				height = 0.8,
			},
		})

		vim.keymap.set("n", "<leader>fw", ":Lspsaga outline<CR>", { noremap = true, silent = true })
		vim.keymap.set({ "n", "v" }, "<leader>tt", ":Lspsaga term_toggle<CR>", { noremap = true, silent = true })
		vim.keymap.set({ "n", "v" }, "<leader>fj", ":Lspsaga term_toggle ranger<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>fa", ":Lspsaga finder<CR>", { noremap = true, silent = true })
		vim.keymap.set({ "n", "v" }, "<leader>fg", ":Lspsaga code_action<CR>", { noremap = true, silent = true })
		vim.keymap.set({ "n", "v" }, "<leader>fi", ":Lspsaga peek_definition<CR>", { noremap = true, silent = true })
		vim.keymap.set(
			{ "n", "v" },
			"<leader>ft",
			":Lspsaga peek_type_definition<CR>",
			{ noremap = true, silent = true }
		)
	end,
}
