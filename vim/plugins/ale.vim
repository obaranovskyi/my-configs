let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1

nnoremap gd :ALEGoToDefinition<CR>

let g:ale_linters = {
\ 'python': ['pyright']
\}

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'json': ['prettier'],
\   'typescript': ['prettier'],
\}

let g:ale_fix_on_save = 1
