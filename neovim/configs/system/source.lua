local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>to", ":e ~/my-configs/neovim/init.lua<CR>", opts)
