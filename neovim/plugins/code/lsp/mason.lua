return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"lunarmodules/Penlight",
	},
	config = function()
		local mason = require("mason")
		mason.setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "◍",
					package_pending = "◍",
					package_uninstalled = "◍",
				},
			},
			log_level = vim.log.levels.INFO,
			max_concurrent_installers = 4,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()

		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}
		capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

		local signs = {
			{ name = "DiagnosticSignError", text = "" },
			{ name = "DiagnosticSignWarn", text = "" },
			{ name = "DiagnosticSignHint", text = "" },
			{ name = "DiagnosticSignInfo", text = "" },
		}

		for _, sign in ipairs(signs) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
		end

		local config = {
			--[[ virtual_text = true, -- INFO: Display virtual text at the end of the line  ]]
			virtual_text = false,
			check_current_line = true,
			--  end of virtual text configuration
			signs = {
				active = signs,
			},
			update_in_insert = false,
			underline = true,
			severity_sort = true,
		}

		vim.diagnostic.config(config)

		local on_attach = function(_, bufnr)
			local opts = { noremap = true, silent = true }
			local function keymap(key, action)
				vim.api.nvim_buf_set_keymap(bufnr, "n", key, action, opts)
			end

			keymap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
			keymap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
			keymap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
			keymap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
			keymap("<C-e>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
			keymap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
			keymap("gr", "<cmd>lua vim.lsp.buf.references()<CR>")
			keymap("<leader>fk", "<cmd>lua vim.lsp.buf.code_action()<CR>")
			vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>fk", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

			keymap("[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>')
			keymap("<leader> ", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>')
			keymap("]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>')

			vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])

			vim.api.nvim_set_keymap("v", "<leader>R", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
		end

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
		vim.lsp.handlers["textDocument/signatureHelp"] =
			vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

		local mason_lspconfig = require("mason-lspconfig")

		-- INFO: Whenever you want to add a LSP server:
		-- 1. it should be installed first, more details here: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
		-- 2. added to the list below
		-- 3. Sometimes you have to install the language server manually, for example: `npm install -g typescript-language-server`
		-- or by using brew
		local servers = {
			"tsserver",
			"cssmodules_ls",
			"emmet_ls",
			"pyright",
			"html",
			"lua_ls",
			"bashls",
			-- (probably it's not needed, it shows ambiguous link issues where are not)
			-- "marksman", -- don't do TSInstall markdown no highlight
			"angularls",
			"typos_lsp",
			"clangd",
		}

		mason_lspconfig.setup({
			ensure_installed = servers,
			automatic_installation = true,
		})

		local lspconfig = require("lspconfig")

		for _, server in pairs(servers) do
			local options = {
				on_attach = on_attach,
				capabilities = capabilities,
			}

			server = vim.split(server, "@")[1]

			-- INFO: "lua_ls" is a special case, it needs to be configured
			-- in order to work properly with global `vim` variable
			if server == "lua_ls" then
				options.settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
							},
						},
					},
				}
			end

			lspconfig[server].setup(options)
		end
	end,
}
