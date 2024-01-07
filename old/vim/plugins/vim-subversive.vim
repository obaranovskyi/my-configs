nmap [ <plug>(SubversiveSubstitute)
nmap [[ <plug>(SubversiveSubstituteLine)
nmap { <plug>(SubversiveSubstituteToEndOfLine)

nmap <leader>[ <plug>(SubversiveSubstituteRange)
xmap <leader>[ <plug>(SubversiveSubstituteRange)
nmap <leader>[[ <plug>(SubversiveSubstituteWordRange)

" When search with / after click siw and proceed with the Ctrl-j
"nmap sn n.

" Substitute (first copy to default register, like `yy`, `diw`, etc.)
" Then change using the motion -> `si"`, `si(`
"
" Update word under cursor with occurrences
" <Leader>ssiB
"
" or -> <leader>'iwiB
" and type the necessary word
"
" or -> <leader>'iw3j
" and then type the value 


let g:yoinkAutoFormatPaste = 0
let g:yoinkMoveCursorToEndOfPaste = 0
let g:yoinkSwapClampAtEnds = 1 " default rotating does not cycle
let g:yoinkIncludeNamedRegisters = 1 " include all registers in the list

