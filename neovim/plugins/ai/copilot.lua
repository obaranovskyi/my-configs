-- More info: https://github.com/github/copilot.vim/blob/49e0348bfb913fae63ca5ddb987a8bccd193da86/doc/copilot.txt#L146
return {
	"github/copilot.vim",
	config = function()
		require("copilot").setup()

		vim.keymap.set({ "i" }, "<C-p>", "<Plug>(copilot-previous)", { silent = true })
		vim.keymap.set({ "i" }, "<C-n>", "<Plug>(copilot-next)", { silent = true })
		vim.keymap.set("i", "<C-L>", "<Plug>(copilot-accept-word)", { silent = true })

		-- The keymaps that are under testing
		--
		-- If you want to use other key than Tab
		-- vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
		-- 	expr = true,
		-- 	replace_keycodes = false,
		-- })
		-- vim.g.copilot_no_tab_map = true
	end,
}

-- NOTE: If you see copilot virtual text and suggestion click `C-e` to hide
-- the suggestion and to choose copilot virtual text
