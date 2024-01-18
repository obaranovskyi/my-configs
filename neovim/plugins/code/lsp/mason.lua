return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "lunarmodules/Penlight"
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

    on_attach = function(_, bufnr)
      local function keymap(key, action)
        local opts = { noremap = true, silent = true }
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

      function lsp_import_action(action)
        if string.find(action.title, "Add import") then
          print('inside')
          return action
        end
      end
      keymap("<leader>ii", "<cmd>lua vim.lsp.buf.code_action({ filter = lsp_import_action, apply = true, })<CR>")

      -- TODO: Under construction
      function lsp_import_all()

      end
      keymap("<leader>iI", "<cmd>lua lsp_import_all()<CR>")

      keymap("[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>')
      keymap("<leader> ", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>')
      keymap("]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>')
      --[[ keymap("<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>") ]]

      vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])

      local opts = { noremap = true, silent = true }

      vim.api.nvim_set_keymap("v", "<leader>R", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    end

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

    local mason_lspconfig = require("mason-lspconfig")
    local servers = {
      "tsserver",
      "cssmodules_ls",
      "emmet_ls",
      "html",
      "lua_ls",
      "jedi_language_server",
      "bashls",
    }

    mason_lspconfig.setup({
      ensure_installed = servers,
      automatic_installation = true,
    })

    local lspconfig = require("lspconfig")

    for _, server in pairs(servers) do
      local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      server = vim.split(server, "@")[1]

      lspconfig[server].setup(opts)
    end

    -- INFO: Neodev configuration
    -- lspconfig.lua_ls.setup({
    -- 	settings = {
    -- 		Lua = {
    -- 			completion = {
    -- 				callSnippet = "Replace",
    -- 			},
    -- 		},
    -- 	},
    -- })
  end,
}
