return {
  'kevinhwang91/nvim-bqf',
  config = function()
    require('bqf').setup({
      auto_enable = true
    })
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap
    keymap('n', '<leader>ga', ":BqfToggle<CR>", opts)
  end
}
