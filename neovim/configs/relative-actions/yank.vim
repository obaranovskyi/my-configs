function! s:YankRowAndJumpBack( ... ) abort
  execute "normal mz"

  let isRange = get(a:, 2, 0)

  if isRange
    execute a:3 . a:1 . ',' . a:3 . a:2 . 'y'
  else
    execute a:2 . a:1 . 'y'
  endif

  execute "normal `z"
  execute "delmarks z"
endfunction

command! -nargs=+ YankTop call s:YankRowAndJumpBack(<f-args>, '-')
command! -nargs=+ YankBottom call s:YankRowAndJumpBack(<f-args>, '+')

nnoremap <leader>c[ :YankTop 
nnoremap <leader>c] :YankBottom 
