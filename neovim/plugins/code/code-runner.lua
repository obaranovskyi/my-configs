return {
	"CRAG666/code_runner.nvim",
	config = function()
		require("code_runner").setup()

		vim.keymap.set("n", "<leader>ra", ":RunCode<CR>")
		vim.keymap.set("n", "<leader>rs", ":RunClose<CR>")
	end,
}
