return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "canary",
	dependencies = {
		{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
		{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
	},
	config = function()
		local chat = require("CopilotChat")
		local config = {
			debug = false,
			window = {
				-- layout = "float",
			},
			show_help = false,
			mappings = {
				complete = {
					detail = "Use @<Tab> or /<Tab> for options.",
					insert = "", -- If i set this hotkey <Tab> will work as expected
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
		}

		vim.keymap.set({ "n", "v" }, "<leader>cc", function()
			chat.toggle()
		end, { silent = true })

		vim.keymap.set({ "v" }, "<leader>ca", function()
			chat.ask("Explain how it works.", {
				selection = require("CopilotChat.select").visual,
				window = {
					layout = "float",
				},
			})
		end, { silent = true })

		chat.setup(config)
	end,
}
