function! s:MoveRowAndJumpBack( ... ) abort
    execute "normal! mz"

    let isRange = get(a:, 2, 0)

    if isRange
        execute a:3 . a:1 . ',' . a:3 . a:2 . 'm.'
    else
        execute a:2 . a:1 . 'm.'
    endif

    execute "normal! `z"
    execute "delmarks z"
endfunction

command! -nargs=+ PositiveRelativeMoveRow call s:MoveRowAndJumpBack(<f-args>, '+')
command! -nargs=+ NegativeRelativeMoveRow call s:MoveRowAndJumpBack(<f-args>, '-')

nnoremap <leader>mj :PositiveRelativeMoveRow 
nnoremap <leader>mk :NegativeRelativeMoveRow 


