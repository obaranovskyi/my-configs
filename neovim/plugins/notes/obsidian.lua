return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
	--   "BufReadPre path/to/my-vault/**.md",
	--   "BufNewFile path/to/my-vault/**.md",
	-- },
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
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
				-- INFO: This is still under construction
				-- I'm still thinking whether to migrate to obsidian
				-- {
				-- 	name = "dev-notes",
				-- 	path = "~/obaranovskyi/repositories/github/my-notes",
				-- },
			},
		})

		-- TODO:
		-- After configuring Obsidian check if the plugin that lets you jump to another markdown file is needed
		vim.keymap.set({ "n", "v" }, "<leader>no", ":ObsidianSearch<CR>", { noremap = true, silent = true })
		vim.keymap.set({ "n", "v" }, "<leader>nn", ":ObsidianNew<CR>", { noremap = true, silent = true })
		vim.keymap.set({ "n", "v" }, "<leader>nw", ":ObsidianWorkspace<CR>", { noremap = true, silent = true })
	end,
}
