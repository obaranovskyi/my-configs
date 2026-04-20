return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "canary",
	dependencies = {
		{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
		{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
	},
	config = function()
		local chat = require("CopilotChat")
		local prompts = require("configs.prompts")
		local config = {
			debug = false,
			window = {
				-- layout = "float",
				-- width = 0.8,
				-- height = 0.8,
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
			prompts = {
				--- Text ---
				GrammarCheck = {
					prompt = prompts.text.grammar_check,
					mapping = "<leader>cg",
					selection = require("CopilotChat.select").visual,
				},
				Rephrase = {
					prompt = prompts.text.rephrase,
					mapping = "<leader>cr",
					selection = require("CopilotChat.select").visual,
				},
				Translate = {
					prompt = prompts.text.translate,
					mapping = "<leader>cu",
					selection = require("CopilotChat.select").visual,
				},
				--- Code ---
				Explain = {
					prompt = prompts.code.explain,
					mapping = "<leader>ca",
					selection = require("CopilotChat.select").visual,
				},
				BestPractices = {
					prompt = prompts.code.best_practices,
					mapping = "<leader>cb",
					selection = require("CopilotChat.select").visual,
				},
				Synonyms = {
					prompt = prompts.text.synonyms,
					mapping = "<leader>cs",
					selection = require("CopilotChat.select").visual,
				},
				ImproveWritingStyle = {
					prompt = prompts.text.improve_writing_style,
					mapping = "<leader>ci",
					selection = require("CopilotChat.select").visual,
				},
				ExplainTechnicalConcept = {
					prompt = prompts.code.explain_technical_concept,
					mapping = "<leader>ct",
					selection = require("CopilotChat.select").visual,
				},
				ExplainErrorMessage = {
					prompt = prompts.code.explain_error_message,
					mapping = "<leader>ce",
					selection = require("CopilotChat.select").visual,
				},
				GenerateMockFromSelection = {
					prompt = prompts.code.generate_mock_from_selection,
					mapping = "<leader>cm",
					selection = require("CopilotChat.select").visual,
				},
				--- Text ---
				Summarize = {
					prompt = prompts.text.summarize,
					mapping = "<leader>cS",
					selection = require("CopilotChat.select").visual,
				},
				Wording = {
					prompt = prompts.text.wording,
					mapping = "<leader>cW",
					selection = require("CopilotChat.select").visual,
				},
				Concise = {
					prompt = prompts.text.concise,
					mapping = "<leader>cX",
					selection = require("CopilotChat.select").visual,
				},
				Usage = {
					prompt = prompts.text.usage,
					mapping = "<leader>cw",
					selection = require("CopilotChat.select").visual,
				},
			},
		}

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

		vim.keymap.set("n", "<leader>cx", function()
			chat.toggle()
			local article_prompt = prompts.blog.article_content_generation
			local lines = {}
			for line in article_prompt:gmatch("([^\n]*)\n?") do
				table.insert(lines, line)
			end

			local row, col = unpack(vim.api.nvim_win_get_cursor(0))
			vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, lines)
			vim.cmd("startinsert")
		end)

		chat.setup(config)

		-- TODO: Under construction
		-- I'm not sure about this line
		require("CopilotChat.integrations.cmp").setup()

		-- INFO: Customize the chat window
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "copilot-*",
			callback = function()
				vim.opt_local.relativenumber = true
			end,
		})
	end,
}
