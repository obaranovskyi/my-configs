local opts = { noremap = true, silent = true }
local opts_nr = { noremap = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', 'g;', "<plug>(GrepperOperator)", opts)
keymap('x', 'g;', "<plug>(GrepperOperator)", opts)

keymap('n', 'gh', ':Grepper -noprompt --tool git -query ""<Left>', opts_nr)
keymap('x', 'gh', ':Grepper -noprompt --tool git -query ""<Left>', opts_nr)

