-- vim.cmd [[
--   nmap s <Plug>(smalls)
--
--   let g:smalls_auto_jump = 1
--   let g:smalls_auto_jump_min_input_length = 2
-- ]]



local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- ------------------------------------------------
-- Common mappings
-- ------------------------------------------------
keymap("n", "s", "<Plug>(smalls)", opts)
vim.g.smalls_auto_jump = 1
vim.g.smalls_auto_jump_min_input_length = 2
