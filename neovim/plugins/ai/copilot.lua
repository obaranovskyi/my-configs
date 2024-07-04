return {
	"github/copilot.vim",
	config = function()
		require("copilot").setup()

		vim.keymap.set({ "i" }, "<C-p>", "<Plug>(copilot-previous)", { silent = true })
		vim.keymap.set({ "i" }, "<C-n>", "<Plug>(copilot-next)", { silent = true })
		vim.keymap.set("i", "<C-L>", "<Plug>(copilot-accept-word)", { silent = true })
	end,
}

-- NOTE: If you see copilot virtual text and suggestion click `C-e` to hide
-- the suggestion and to choose copilot virtual text
