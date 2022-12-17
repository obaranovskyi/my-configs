local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.cmd [[
  function! ClearRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
      call setreg(r, [])
    endfor
  endfunction
]]

-- Use a s d f g for registers
keymap('n', '<leader>re', ':reg a s d f g<CR>', opts)
keymap('n', '<leader>rd', ':call ClearRegisters()<CR>', opts)
