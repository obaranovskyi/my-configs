return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
	config = function()
		local opts = { noremap = true, silent = true }
		local keymap = vim.api.nvim_set_keymap
		keymap("n", "<leader>sm", "<Plug>MarkdownPreview", opts)
		vim.g.markdown_fenced_languages = {
			"html",
			"css",
			"scss",
			"python",
			"bash=sh",
			"sql",
			"javascript",
			"typescript",
			"lua",
		}
		vim.g.mkdp_theme = "light"
	end,
}
