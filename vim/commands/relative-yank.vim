function! s:YankRowAndJumpBack( ... ) abort
    execute "normal ma"

    let isRange = get(a:, 2, 0)

    if isRange
        execute a:3 . a:1 . ',' . a:3 . a:2 . 'y'
    else
        execute a:2 . a:1 . 'y'
    endif

    execute "normal `a"
    execute "delmarks a"
endfunction

command! -nargs=+ PositiveRelativeYankRow call s:YankRowAndJumpBack(<f-args>, '+')
command! -nargs=+ NegativeRelativeYankRow call s:YankRowAndJumpBack(<f-args>, '-')

nnoremap <leader>cj :PositiveRelativeYankRow 
nnoremap <leader>ck :NegativeRelativeYankRow 
