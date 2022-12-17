" TODO: Under construction

set nu rnu
" nnoremap : :set nornu<CR>:
" nnoremap / :set nornu<CR>/
" nnoremap ? :set nornu<CR>?
" 
" vnoremap : :set nornu<CR>:
" vnoremap / :set nornu<CR>/
" vnoremap ? :set nornu<CR>?
" 
" cnoremap <silent> <CR> <CR>:set nu rnu<CR>
" cnoremap <silent> <Esc> <Esc>:set nu rnu<CR>
" cnoremap <silent> <C-c> <C-c>:set nu rnu<CR>

" Last version
"function! HandleRNumbers()
  "if expand('%') !~# 'NERD_tree_\d' && &number
    "nnoremap <buffer> : :set nornu<CR>:
    "nnoremap <buffer> / :set nornu<CR>/
    "nnoremap <buffer> ? :set nornu<CR>?

    "vnoremap <buffer>: :set nornu<CR>:
    "vnoremap <buffer>/ :set nornu<CR>/
    "vnoremap <buffer>? :set nornu<CR>?
    
    "cnoremap <buffer><silent> <CR> <CR>:set nu rnu<CR>
    "cnoremap <buffer><silent> <Esc> <Esc>:set nu rnu<CR>
    "cnoremap <buffer><silent> <C-c> <C-c>:set nu rnu<CR>
    "echom "=== WINDOW ==="
  ""if isListed && isAlreadyInManager && isNERDTreeBuffer
  "else
    "silent! nunmap :
    "silent! nunmap /
    "silent! nunmap ?

    "silent! vunmap :
    "silent! vunmap /
    "silent! vunmap ?
    
    "silent! cunmap <CR>
    "silent! cunmap <Esc>
    "silent! cunmap <C-c>

    "echom "=== NERDTree ==="
    "execute ":set nonu"
  "endif
"endfunction


"" autocmd BufEnter * :call HandleRNumbers()
"autocmd BufEnter * :call HandleRNumbers()
