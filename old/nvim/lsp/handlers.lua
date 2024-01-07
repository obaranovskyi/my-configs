local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end

M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "?" },
    { name = "DiagnosticSignWarn",  text = "?" },
    { name = "DiagnosticSignHint",  text = "?" },
    { name = "DiagnosticSignInfo",  text = "?" },
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
end


M.on_attach = function(_, bufnr)
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
  keymap("<leader>R", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  keymap("[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>')
  keymap("gl", '<cmd>lua vim.diagnostic.open_float()<CR>')
  keymap("]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>')
  --[[ keymap("<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>") ]]

  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])


  local opts = { noremap = true, silent = true }

  vim.api.nvim_set_keymap("v","<leader>R", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
end

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

return M
