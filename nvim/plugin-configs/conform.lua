local conform = require('conform')

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    javascript = { { "prettierd", "prettier" } },
    typescript = { "prettier" },
    json = { "biome" },
  },
  -- format_on_save = {
  --   -- I recommend these options. See :help conform.format for details.
  --   lsp_fallback = true,
  --   timeout_ms = 500,
  -- },
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
  require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })

vim.keymap.set("n", "<leader>fd", ':Format<CR>', { noremap = true, silent = true })
