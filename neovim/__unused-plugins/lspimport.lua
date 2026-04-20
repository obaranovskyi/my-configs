return {
	"stevanmilic/nvim-lspimport",
	config = function()
		local lspimport = require("lspimport")
		lspimport.setup()
		vim.keymap.set({ "n", "v" }, "<leader>fk", lspimport.import, { noremap = true, silent = true })
	end,
}
