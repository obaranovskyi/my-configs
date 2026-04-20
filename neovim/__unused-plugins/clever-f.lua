return {
  'rhysd/clever-f.vim',
  config = function()
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n', ';', '<Plug>(clever-f-repeat-forward)', opts)
    vim.api.nvim_set_keymap('n', ',', '<Plug>(clever-f-repeat-back)', opts)
  end
}
