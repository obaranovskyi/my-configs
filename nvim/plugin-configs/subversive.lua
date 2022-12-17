vim.cmd [[
  nmap x <plug>(SubversiveSubstitute)
  nmap xx <plug>(SubversiveSubstituteLine)
  nmap { <plug>(SubversiveSubstituteToEndOfLine)

  nmap <leader>x <plug>(SubversiveSubstituteRange)
  xmap <leader>x <plug>(SubversiveSubstituteRange)
  nmap <leader>xx <plug>(SubversiveSubstituteWordRange)

  " Substitute (first copy to default register, like `yy`, `diw`, etc.)
  " Then change using the motion -> `[iw`, `si(`, `[i"`
  "
  " Modifying multiple lines
  " 1. <leader>[[i{  or  <leader>[[3j
  " 2. Enter the desired value

  let g:yoinkAutoFormatPaste = 0
  let g:yoinkMoveCursorToEndOfPaste = 0
  let g:yoinkSwapClampAtEnds = 1 " default rotating does not cycle
  let g:yoinkIncludeNamedRegisters = 1 " include all registers in the list
]]
