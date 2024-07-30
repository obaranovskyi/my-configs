-- config example: https://github.dev/sindrets/diffview.nvim?tab=readme-ov-file
-- or in the doc: https://github.com/sindrets/diffview.nvim?tab=readme-ov-file#configuration

return {
	"sindrets/diffview.nvim",
	config = function()
		require("diffview").setup({
			view = {
				merge_tool = {
					layout = "diff3_mixed",
					disable_diagnostics = true,
					winbar_info = true,
				},
			},
		})

		local opts = { noremap = true, silent = true }
		local keymap = vim.api.nvim_set_keymap

		keymap("n", "<leader>gd", ":DiffviewOpen<CR>", opts)
		keymap("n", "<leader>ge", ":DiffviewClose<CR>", opts) -- or <leader>id to close buffer
		keymap("n", "<leader>gh", ":DiffviewFileHistory %<CR>", opts)
		keymap("v", "<leader>gh", ":DiffviewFileHistory<CR>", opts)
		keymap("n", "<leader>gH", ":DiffviewFileHistory<CR>", opts)
	end,
}

-- INFO:
-- :h copy-diffs
-- :h diffview-merge-tool
-- :h diffview-config-view.x.layout
