return {
	"mhinz/vim-grepper",
	config = function()
		local opts = { noremap = true, silent = true }
		local keymap = vim.api.nvim_set_keymap

		keymap("n", "g;", "<plug>(GrepperOperator)", opts)
		keymap("x", "g;", "<plug>(GrepperOperator)", opts)

		keymap("n", "gh", ":GrepperGit ", opts)
		keymap("x", "gh", ":GrepperGit ", opts)
	end,
}
