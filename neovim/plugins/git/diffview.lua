-- config example: https://github.dev/sindrets/diffview.nvim?tab=readme-ov-file
--    { "n", "<tab>",       actions.select_next_entry,              { desc = "Open the diff for the next file" } },
--    { "n", "<s-tab>",     actions.select_prev_entry,              { desc = "Open the diff for the previous file" } },
--    { "n", "[F",          actions.select_first_entry,             { desc = "Open the diff for the first file" } },
--    { "n", "]F",          actions.select_last_entry,              { desc = "Open the diff for the last file" } },
--    { "n", "gf",          actions.goto_file_edit,                 { desc = "Open the file in the previous tabpage" } },
--    { "n", "<C-w><C-f>",  actions.goto_file_split,                { desc = "Open the file in a new split" } },
--    { "n", "<C-w>gf",     actions.goto_file_tab,                  { desc = "Open the file in a new tabpage" } },
--    { "n", "<leader>e",   actions.focus_files,                    { desc = "Bring focus to the file panel" } },
--    { "n", "<leader>b",   actions.toggle_files,                   { desc = "Toggle the file panel." } },
--    { "n", "g<C-x>",      actions.cycle_layout,                   { desc = "Cycle through available layouts." } },
--    { "n", "[x",          actions.prev_conflict,                  { desc = "In the merge-tool: jump to the previous conflict" } },
--    { "n", "]x",          actions.next_conflict,                  { desc = "In the merge-tool: jump to the next conflict" } },
--    { "n", "<leader>co",  actions.conflict_choose("ours"),        { desc = "Choose the OURS version of a conflict" } },
--    { "n", "<leader>ct",  actions.conflict_choose("theirs"),      { desc = "Choose the THEIRS version of a conflict" } },
--    { "n", "<leader>cb",  actions.conflict_choose("base"),        { desc = "Choose the BASE version of a conflict" } },
--    { "n", "<leader>ca",  actions.conflict_choose("all"),         { desc = "Choose all the versions of a conflict" } },
--    { "n", "dx",          actions.conflict_choose("none"),        { desc = "Delete the conflict region" } },
--    { "n", "<leader>cO",  actions.conflict_choose_all("ours"),    { desc = "Choose the OURS version of a conflict for the whole file" } },
--    { "n", "<leader>cT",  actions.conflict_choose_all("theirs"),  { desc = "Choose the THEIRS version of a conflict for the whole file" } },
--    { "n", "<leader>cB",  actions.conflict_choose_all("base"),    { desc = "Choose the BASE version of a conflict for the whole file" } },
--    { "n", "<leader>cA",  actions.conflict_choose_all("all"),     { desc = "Choose all the versions of a conflict for the whole file" } },
--    { "n", "dX",          actions.conflict_choose_all("none"),    { desc = "Delete the conflict region for the whole file" } },

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
