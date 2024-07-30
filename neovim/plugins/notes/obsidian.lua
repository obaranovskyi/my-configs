return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = false, -- load at the beginning of the session so I can open right from the start
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("obsidian").setup({
			-- TODO: I can put some cloud directory to see the notes online
			-- - this should work on web and on mobile
			workspaces = {
				{
					name = "personal-notes",
					path = "~/my-notes/vault/personal",
				},
				{
					name = "work-notes",
					path = "~/my-notes/vault/work",
				},
				-- INFO: I will migrate to obsidian
				-- But I need to configure everything first, before going to my real notes
				{
					name = "dev-notes",
					path = "~/obaranovskyi/repositories/github/my-notes",
				},
			},
			-- No need in `wiki` links
			preferred_link_style = "markdown",
			-- No need in header props
			disable_frontmatter = true,
		})

		vim.keymap.set({ "n", "v" }, "<leader>no", ":ObsidianSearch<CR>", { noremap = true, silent = true })
		vim.keymap.set({ "n", "v" }, "<leader>nn", ":ObsidianNew<CR>", { noremap = true, silent = true })
		vim.keymap.set({ "n", "v" }, "<leader>nw", ":ObsidianWorkspace<CR>", { noremap = true, silent = true })
		vim.keymap.set({ "v" }, "<leader>nl", ":ObsidianLinkNew ", { noremap = true, silent = true })
	end,
}
