" --- Clipboard Mappings
nmap <leader>y "*y
vmap <leader>y "*y
nmap <leader>p  "+p
vmap <leader>p  "+p

" --- File Mappings
nnoremap <leader>w :wa<cr>
noremap <leader>q :q<cr>
noremap <leader>; gf

" Add empty line in NORMAL MODE
" nmap <CR> O<Esc>j
" Move the rest of the line to the next line
" Note: Movement should be done on the space
nmap <leader><CR> r<CR><Esc>
" Add Backspace in NORMAL MODE
" nmap <BS> dd

" Insert mode: Navigation
inoremap jk <C-c>:w<cr> " now using vim-auto-save plugin
"inoremap jk <Esc> " when vim-auto-save is disabled

inoremap jl <Esc>la
inoremap jL <Esc>A
inoremap jh <Esc>i
inoremap jH <Esc>I
inoremap jj <Esc>S
inoremap jJ <Esc>Ji
inoremap jx <Esc>lxi
inoremap jX <Esc>lDi
inoremap jd <Esc>xi
inoremap jn <Esc>o
inoremap jy <Esc>O<Esc><Down>A
inoremap jG <Esc>Go
inoremap jA <Esc>ggO
inoremap jf <Esc>f
inoremap jF <Esc>F
inoremap j> <Esc>>>i
inoremap j< <Esc><<i
inoremap jU <Esc>gUiwea

nnoremap ga GVgg

" TODO: has issues
" nnoremap <leader>r :source %<CR>

" --- Moving lines in Visual Mode
xnoremap K :move '<-2<CR>gv=gv
xnoremap J :move '>+1<CR>gv=gv

" Windows: Splitting
nnoremap <leader>- <C-w>s
" nnoremap <leader>\| <C-w>v
nnoremap <leader>\ <C-w>v

" Buffers: Movement
map gq :Bclose<CR>
map go :BufOnly<CR>
noremap <S-l> :bn<CR>
noremap <S-h> :bp<CR>

" QuickFix list movement
nnoremap ge :cnext<CR>
nnoremap gw :cprev<CR>
nnoremap gb :cfirst<CR>
nnoremap gl :clast<CR>
nnoremap gx :botright copen<CR>

" Command line mode: navigation
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Other helpful mappings
nnoremap X dd

" Remove whit the "option+backspace"
map! <M-BS> <C-W>

