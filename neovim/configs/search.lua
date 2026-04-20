-- [Single file mode]
local left = function(repeat_count)
  return string.rep('<Left>', repeat_count)
end
local rPrefix = "<leader>r"
local subs = ":%s/<C-r>h//g"

vim.keymap.set("v", rPrefix .. "f", '"hy' .. subs .. 'c | :noh' .. left(10))
vim.keymap.set("v", rPrefix .. "t", '"hy' .. subs .. ' | :noh' .. left(9))

vim.keymap.set("n", rPrefix .. "f", '"hyiw' .. subs .. 'c | :noh' .. left(10))
vim.keymap.set("n", rPrefix .. "t", '"hyiw' .. subs .. ' | :noh' .. left(9))

vim.keymap.set("n", rPrefix .. "F", '"hyiW' .. subs .. 'c | :noh' .. left(10))
vim.keymap.set("n", rPrefix .. "T", '"hyiW' .. subs .. ' | :noh' .. left(9))

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

