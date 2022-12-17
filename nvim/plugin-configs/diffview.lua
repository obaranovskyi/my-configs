local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap


keymap("n", "<leader>gdo", ":DiffviewOpen<CR>", opts)
keymap("n", "<leader>gdc", ":DiffviewClose<CR>", opts)
keymap("n", "<leader>gdh", ":DiffviewFileHistory %<CR>", opts)
keymap("v", "<leader>gdh", ":DiffviewFileHistory <CR>", opts)

-- TODO: Need to configure colors
vim.cmd [[
" hi DiffAdd      gui=none    guifg=NONE          guibg=#bada9f
" hi DiffChange   gui=none    guifg=NONE          guibg=#e5d5ac
" hi DiffDelete   gui=bold    guifg=#ff8080       guibg=#ffb0b0
" hi DiffText     gui=none    guifg=NONE          guibg=#8cbee2
]]
