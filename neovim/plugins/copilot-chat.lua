return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		config = function()
			local chat = require("CopilotChat")

			chat.setup({
				debug = true,
				-- default mappings
				mappings = {
					complete = {
						detail = "Use @<Tab> or /<Tab> for options.",
						insert = "<C-e>", -- If i set this hotkey <Tab> will work as expected
					},
					close = {
						normal = "q",
						insert = "<C-c>",
					},
					reset = {
						normal = "<C-R>",
						insert = "<C-R>",
					},
					submit_prompt = {
						normal = "<CR>",
						insert = "<CR>",
					},
					accept_diff = {
						normal = "<C-y>",
						insert = "<C-y>",
					},
					yank_diff = {
						normal = "gy",
					},
					show_diff = {
						normal = "gd",
					},
					show_system_prompt = {
						normal = "gp",
					},
					show_user_selection = {
						normal = "gs",
					},
				},
			})

			local opts = { noremap = true, silent = false }
			vim.keymap.set({ "n", "v" }, "<leader>cc", ':lua require("CopilotChat").toggle()<CR>', opts)
		end,
	},
}
