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
				layout = "float",
				width = 0.8,
				height = 0.8,
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
					insert = "<C-s>",
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

		function setKeymapWithPrompt(modes, keymap, prompt)
			vim.keymap.set(modes, keymap, function()
				chat.ask(prompt, {
					selection = require("CopilotChat.select").visual,
					window = {
						layout = "float",
					},
				})
			end, { silent = true })
		end

		vim.keymap.set({ "n", "v" }, "<leader>cc", function()
			chat.toggle()
			vim.cmd("startinsert")
		end, { silent = true })

		vim.keymap.set({ "n", "v" }, "<leader>co", function()
			local actions = require("CopilotChat.actions")
			actions.pick(actions.prompt_actions({
				selection = require("CopilotChat.select").visual,
			}))
		end, { silent = true })

		setKeymapWithPrompt({ "v" }, "<leader>ca", "Explain how it works.")

		setKeymapWithPrompt(
			{ "v" },
			"<leader>cm",
			[[
      Please check if it's grammatically correct to say this way.
      If it's incorrect, rephrase it and provide me with the grammatically correct version.
      The correction version should be highlighted so it would be easier to find it immediately.
      Also, include an explanation of where I made a mistake and how to fix this mistake.
      ]]
		)

		setKeymapWithPrompt(
			{ "v" },
			"<leader>cv",
			[[
      Provide me with a few options for rephrasing.
      If there are grammar mistakes, correct them with an explanation.
      ]]
		)

		setKeymapWithPrompt({ "v" }, "<leader>cu", "Translate this to Ukrainian. Provide only the translation.")

		setKeymapWithPrompt(
			{ "v" },
			"<leader>cb",
			"Review this code and point out any best practices that I may have missed."
		)

		setKeymapWithPrompt(
			{ "v" },
			"<leader>cs",
			"Suggest synonyms for the highlighted word and explain the differences in usage."
		)

		setKeymapWithPrompt({ "v" }, "<leader>ci", "Suggest ways to improve the writing style of this text.")

		setKeymapWithPrompt(
			{ "v" },
			"<leader>ct",
			"Explain this technical concept in simple English suitable for a beginner."
		)

		setKeymapWithPrompt(
			{ "v" },
			"<leader>ce",
			"Translate this error message into plain English and suggest how to fix it."
		)

		chat.setup(config)

		-- INFO: Customize the chat window
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "copilot-*",
			callback = function()
				vim.opt_local.relativenumber = true
			end,
		})
	end,
}
