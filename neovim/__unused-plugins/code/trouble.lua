-- TODO: This all should be updated as everything here is deprecated
return {
	"folke/trouble.nvim",
	config = function()
		require("trouble").setup({})

		vim.keymap.set("n", "<leader>tD", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
		vim.keymap.set(
			"n",
			"<leader>td",
			"<cmd>TroubleToggle document_diagnostics<cr>",
			{ silent = true, noremap = true }
		)
		vim.keymap.set("n", "<leader>tr", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })
	end,
}
