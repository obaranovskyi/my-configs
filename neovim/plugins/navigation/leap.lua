return {
	"ggandor/leap.nvim",
	dependencies = {
		"tpope/vim-repeat",
	},
	config = function()
		vim.keymap.set("n", "s", function()
			require("leap").leap({
				-- jump through all the windows
				target_windows = require("leap.user").get_focusable_windows(),
				opts = {
					safe_labels = {}, -- Don't jump to the first match
				},
			})
		end)

		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
				vim.api.nvim_set_hl(0, "LeapLabel", {
					bg = "gold",
					fg = "black",
					bold = false,
					nocombine = true,
				})
			end,
		})
	end,
	lazy = false,
}
