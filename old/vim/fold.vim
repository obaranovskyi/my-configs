set foldmethod=syntax			" syntax highlighting items specify folds 
set foldlevelstart=99           " start file with all folds opened
"set foldlevel=1                " if comment out `foldlevelstart` and
                                " uncomment current line, ts classes for
                                " instance will have folded methods.
set foldcolumn=0				" defines 1 col at window left, to indicate folding
setlocal foldcolumn=0           " hide foldcolumn
let javascript_fold=1			" activate folding by JS syntax
set foldnestmax=2               " max fold the second level
set fillchars=fold:\ 

function! NeatFoldText()
    let line = substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf(lines_count . ' lines') . ' |'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart(repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . foldtextend
endfunction

set foldtext=NeatFoldText()

highlight Folded guibg=#1a73e8 guifg=White

" Click to fold inner folding (class methods)
nnoremap z; zMzr
