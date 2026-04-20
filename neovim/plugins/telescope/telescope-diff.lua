return {
	"jemag/telescope-diff.nvim",
	config = function()
		require("telescope").load_extension("diff")

		vim.keymap.set("n", "<leader>ss", function()
			require("telescope").extensions.diff.diff_files({ hidden = true })
		end, { desc = "Compare 2 files" })

		vim.keymap.set("n", "<leader>sc", function()
			require("telescope").extensions.diff.diff_current({ hidden = true })
		end, { desc = "Compare file with current" })
	end,
}
