local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>to", ":e ~/my-configs/nvim/init.lua<CR>", opts)

-- INFO: This doesn't work
vim.api.nvim_set_keymap("n", "<leader>ts", ":luafile ~/.config/nvim/init.lua<CR>", opts)
