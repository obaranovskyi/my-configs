nnoremap <leader>u :UndotreeToggle<CR>

" Sometimes there might be no permissions or directory
" First create folder
" `mkdir ~/.undodir``
" Then give rights
" `chmod 777 ~/.undodir`
if has("persistent_undo")
    set undodir=$HOME/.undodir
    set undofile
endif


if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 2
endif

