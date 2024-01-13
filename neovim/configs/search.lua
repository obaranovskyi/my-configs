-- [Single file mode]
local left9 = string.rep('<Left>', 9)
local left10 = string.rep('<Left>', 10)
local rPrefix = "<leader>r"
local subs = ":%s/<C-r>h//g"

vim.keymap.set("v", rPrefix .. "f", '"hy' .. subs .. 'c | :noh' .. left10)
vim.keymap.set("v", rPrefix .. "t", '"hy' .. subs .. ' | :noh' .. left9)

vim.keymap.set("n", rPrefix .. "f", '"hyiw' .. subs .. 'c | :noh' .. left10)
vim.keymap.set("n", rPrefix .. "t", '"hyiw' .. subs .. ' | :noh' .. left9)

vim.keymap.set("n", rPrefix .. "F", '"hyiW' .. subs .. 'c | :noh' .. left10)
vim.keymap.set("n", rPrefix .. "T", '"hyiW' .. subs .. ' | :noh' .. left9)

-- INFO: This has to be investigated
vim.cmd [[
  " NOTE: can be used with the `cgn  and `dgn`
  " vnoremap <leader>rw /<C-r><C-w>
  " nnoremap <leader>rw /<C-r><C-w>
  " nnoremap <leader>rW /<C-r><C-a>

  " Repeat last substitution
  nnoremap & :&&<CR>:w<CR>
  xnoremap & :&&<CR>:w<CR>
]]

