return {
  'stevearc/conform.nvim',
  config = function()
    local conform = require('conform')

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "biome" },
      },

      format_after_save = function(bufnr)
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

    vim.keymap.set("n", "<leader>fd", ':Format<CR>', { noremap = true, silent = true })
  end
}
