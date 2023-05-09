local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- INFO: There are few Telescope themes
-- * ivy
-- * dropdown
-- * cursor

-- CONF: Show with file content
keymap("n", "<C-p>", ":Telescope find_files hidden=true<CR>", opts)
-- CONF: Show with file content as a dropdown
--[[ keymap("n", "<leader>e", ":Telescope find_files theme=dropdown<CR>", opts) ]]
-- CONF: Show without file content
keymap("n", "<leader>e", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false, hidden = false }))<cr>", opts)

-- Show with particular theme
--[[ keymap("n", "<leader>g", ":Telescope live_grep theme=dropdown<CR>", opts) ]]
keymap("n", "<leader>ff", ":Telescope live_grep theme=ivy<CR>", opts)
keymap("n", "<leader>fj", ":Telescope jumplist<CR>", opts)


-- INFO: grep_string() fn helps to fin
-- INFO: Now using vim-grepper for this goal
-- keymap('n', 'g;', "<cmd>lua require'telescope.builtin'.grep_string()<cr>", opts)
-- keymap('x', 'g;', "<cmd>lua require'telescope.builtin'.grep_string()<cr>", opts)
