require("zen-mode").setup { }

local keymap = vim.keymap

keymap.set('n', '<leader>zn', ':ZenMode<CR>', { noremap = true })
