require('telescope').setup{
    extensions = {
        ctags_outline = {
            --ctags option
            ctags = {'ctags'},
            --ctags filetype option
            ft_opt = {
                vim = '--vim-kinds=fk',
                lua = '--lua-kinds=fk',
            },
        },
    },
}

require('telescope').load_extension('ctags_outline')

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>fe", ":Telescope ctags_outline outline theme=dropdown previewer=false<CR>", opts)
