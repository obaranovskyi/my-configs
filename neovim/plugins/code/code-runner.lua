return {
	"CRAG666/code_runner.nvim",
	config = function()
		require("code_runner").setup()

		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>ra", ":RunClose<CR>:RunCode<CR>", opts)
		vim.keymap.set("n", "<leader>rs", ":RunClose<CR>", opts)
	end,
}
