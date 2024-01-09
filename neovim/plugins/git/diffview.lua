return {
  'sindrets/diffview.nvim',
  config = function()
    require('diffview').setup({})

    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap

    keymap("n", "<leader>gdo", ":DiffviewOpen<CR>", opts)
    keymap("n", "<leader>gdc", ":DiffviewClose<CR>", opts)
    keymap("n", "<leader>gdf", ":DiffviewFileHistory %<CR>", opts)
    keymap("v", "<leader>gdf", ":DiffviewFileHistory <CR>", opts)
  end
}

-- INFO:
-- :h copy-diffs
-- :h diffview-merge-tool
-- :h diffview-config-view.x.layout
