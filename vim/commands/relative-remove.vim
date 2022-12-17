function! s:RemoveRowAndJumpBack( ... ) abort
    execute "normal ma"

    let isRange = get(a:, 2, 0)

    if isRange
        execute a:3 . a:1 . ',' . a:3 . a:2 . 'd'
    else
        execute a:2 . a:1 . 'd'
    endif

    execute "normal `a"
    execute "delmarks a"
endfunction

command! -nargs=+ PositiveRelativeRemoveRow call s:RemoveRowAndJumpBack(<f-args>, '+')
command! -nargs=+ NegativeRelativeRemoveRow call s:RemoveRowAndJumpBack(<f-args>, '-')

nnoremap <leader>dj :PositiveRelativeRemoveRow 
nnoremap <leader>dk :NegativeRelativeRemoveRow 
