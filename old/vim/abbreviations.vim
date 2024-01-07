" Remove unnecessary spaces
" For instance - iab td /* TODO: */<Left><Left><Left><c-r>=Eatchar('\s')<cr>
func Eatchar(pat)
   let c = nr2char(getchar(0))
   return (c =~ a:pat) ? '' : c
endfunc

" Removes unnecessary spaces but leaves one
func OneEatchar(pat)
   let c = nr2char(getchar(0))
   return (c =~ a:pat) ? ' ' : c
endfunc

" Markdown abbreviations
abbr 1h [go back](../README.md)<CR><CR><CR>#<C-r>=OneEatchar('\s')<CR>
abbr 2h [go back](../../README.md)<CR><CR><CR>#<C-r>=OneEatchar('\s')<CR>
abbr 3h [go back](../../../README.md)<CR><CR><CR>#<C-r>=OneEatchar('\s')<CR>
abbr 4h [go back](../../../../README.md)<CR><CR><CR>#<C-r>=OneEatchar('\s')<CR>
abbr _js ```javascript<CR><Esc><Up>
abbr _html ```html<CR><Esc><Up>
abbr _css ```css<CR><Esc><Up>
abbr _ts ```typescript<CR><Esc><Up>
abbr _vim ```vim<CR><Esc><Up>
abbr _py ```python<CR><Esc><Up>
abbr _bash ```bash<CR><Esc><Up>
abbr _? ```<CR><Esc>dd<Up>

abbr _o _Output:_<CR>```<C-r>=OneEatchar('\s')<CR><BS><CR><BS><Esc>
abbr _r _Result:_<CR>```<C-r>=OneEatchar('\s')<CR><BS><CR><BS><Esc>

abbr <silent> _l ![](./.png)<Esc><Left><Left><Left><Left>i<c-r>=Eatchar<Esc>
abbr <silent> _2l ![](../.png)<Esc><Left><Left><Left><Left>i<c-r>=Eatchar<Esc>
abbr <silent> _il ![](./images/.png)<Esc><Left><Left><Left><Left>i<c-r>=Eatchar<Esc>

