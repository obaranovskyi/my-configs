function! s:RemoveRowAndJumpBack( ... ) abort
  execute "normal mz"

  let isRange = get(a:, 2, 0)

  if isRange
    execute a:3 . a:1 . ',' . a:3 . a:2 . 'd'
  else
    execute a:2 . a:1 . 'd'
  endif

  execute "normal `z"
  execute "delmarks z"
endfunction

command! -nargs=+ RemoveBottom call s:RemoveRowAndJumpBack(<f-args>, '+')
command! -nargs=+ RemoveTop call s:RemoveRowAndJumpBack(<f-args>, '-')

nnoremap <leader>d[ :RemoveTop 
nnoremap <leader>d] :RemoveBottom 
