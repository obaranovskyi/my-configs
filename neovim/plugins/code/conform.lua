return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				tsx = { "prettier" },
				json = { "prettier" },
				-- markdown = { "mdformat" },
				markdown = { "prettierd" },
			},

			formatters = {
				typescriptreact = {
					inherit = true, -- if there is a .prettierrc.json in the root the rules in that file will have higher priority
				},
			},

			-- Auto format
			-- VSCode uses prettier 2.8.8 version
			-- To install it using mason:
			-- `MasonInstall prettier@2.8.8`
			-- NOTE: If you update all mason packages, you will get the latest version of prettier
			-- you'll need to reinstall the version you want again after the update
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { lsp_fallback = true }
			end,
		})

		-- :LSPInstall on the file you want to add language server
		-- For instance: json ("biome")

		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end
			conform.format({ async = true, lsp_fallback = true, range = range })
		end, { range = true })

		local function print_formatter_status()
			if vim.g.disable_autoformat then
				print("Autoformat is disabled")
			else
				print("Autoformat is enabled")
			end
		end

		-- INFO: toggle autoformat
		vim.api.nvim_create_user_command("FormatToggle", function()
			vim.g.disable_autoformat = not vim.g.disable_autoformat
			print_formatter_status()
		end, {
			desc = "Toggle autoformat-on-save",
		})
		vim.keymap.set("n", "<leader>fT", ":FormatToggle<CR>", { noremap = true, silent = true })

		-- INFO: Print formatter status
		vim.api.nvim_create_user_command("FormatterStatus", function()
			print_formatter_status()
		end, {
			desc = "Print formatter status",
		})
		vim.keymap.set("n", "<leader>fS", ":FormatterStatus<CR>", { noremap = true, silent = true })

		vim.keymap.set("n", "<leader>fd", ":Format<CR>", { noremap = true, silent = true })

		-- INFO: Disable format
		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,
}
