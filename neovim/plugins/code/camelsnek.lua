return {
 'nicwest/vim-camelsnek',
  config = function()
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap

    keymap("v", "<leader>cs", ":Snek<CR>", opts)
    keymap("v", "<leader>cS", ":Kebab<CR>", opts)
    keymap("v", "<leader>cc", ":CamelB<CR>", opts)
    keymap("v", "<leader>cp", ":Camel<CR>", opts)

    keymap("n", "<leader>cs", ":Snek<CR>", opts)
    keymap("n", "<leader>cS", ":Kebab<CR>", opts)
    keymap("n", "<leader>cc", ":CamelB<CR>", opts)
    keymap("n", "<leader>cp", ":Camel<CR>", opts)
  end
}
