-- First, we declare an empty object and put auto-complete features from nvim-cmp (we will set up cmp.lua later) in the LSP
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
    virtual_text = true,
    signs = {
      active = signs,
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
  }

  vim.diagnostic.config(config)
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }

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
  --[[ keymap("<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>") ]]
  keymap("[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>')
  keymap("gl", '<cmd>lua vim.diagnostic.open_float()<CR>')
  keymap("]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>')
  --[[ keymap("<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>") ]]

  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
end

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

function M.enable_format_on_save()
  -- vim.cmd [[
  --   augroup format_on_save
  --       autocmd!
  --       autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })
  --   augroup end
  --   ]]
  -- vim.notify "Enabled format on save"
end

function M.disable_format_on_save()
  M.remove_augroup "format_on_save"
  vim.notify "Disabled format on save"
end

function M.toggle_format_on_save()
  if vim.fn.exists "#format_on_save#BufWritePre" == 0 then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

function M.remove_augroup(name)
  if vim.fn.exists("#" .. name) == 1 then
    vim.cmd("au! " .. name)
  end
end

vim.cmd [[ command! LspToggleAutoFormat execute 'lua ]]

-- Toggle "format on save" once, to start with the format on.
M.toggle_format_on_save()

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

return M
