map <C-n> :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFind<CR> " reveal nerdtree with opened file

" Close Nerdtree if it's only opened window
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" let g:NERDTreeIndicatorMapCustom = {
"     \ "Modified"  : "✹",
"     \ "Staged"    : "✚",
"     \ "Untracked" : "✭",
"     \ "Renamed"   : "➜",
"     \ "Unmerged"  : "═",
"     \ "Deleted"   : "✖",
"     \ "Dirty"     : "✗",
"     \ "Clean"     : "✔︎",
"     \ 'Ignored'   : '☒ ',
"     \ "Unknown"   : "?"
"     \ }

let g:NERDTreeShowIgnoredStatus = 0
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=30
" Hide help line from file explorer
let NERDTreeMinimalUI=1

" Auto open Nerdtree
autocmd vimenter * NERDTree
autocmd VimEnter * NERDTree | wincmd p

" window size
let g:NERDTreeWinSize=55

" window side
let g:NERDTreeWinPos="right"

" hide arrows
let NERDTreeDirArrowExpandable = ""
let NERDTreeDirArrowCollapsible = ""

" Open the existing NERDTree on each new tab. 
" Info this has issue when quickfix list is opened: ( on :copen )
"autocmd BufWinEnter * silent NERDTreeMirror
