" ***********************************************
" Base configurations                           *
" ***********************************************
set hidden                      " Do not close buffers (Better to use with bclose plugin)
set encoding=utf-8              " use utf-8 encoding

set nospell                     " turned off as using https://github.com/kamykn/spelunker.vim
" set spell spelllang=en_us

" set clipboard+=unnamedplus    " use clipboard instead of registers

set mouse=a                     " use mouse as in usual program

set shortmess=A                 " remove swap message 
set autoread                    " If file will be changed the it will be auto reloaded
set ai                          " auto indenting
set history=100                 " keep 100 lines of history
set ruler                       " show the cursor position
set timeoutlen=500              " Time in milliseconds to wait for a mapped sequence to complete.

set listchars=tab:>-,trail:.,extends:→,precedes:←,space:.,eol:¬
set list

set cursorline                  " highlight line
set tabstop=2                   " a tab is two spaces
set softtabstop=2               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " insert spaces instead of tabs
set shiftwidth=2                " number of spaces to use for auto indenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set autoindent                  " always set auto indenting on
set copyindent

set showmatch                   " set show matching parenthesis
set smarttab                    " insert tabs on the start of a line according to shiftwidth, not tabstop
set scrolloff=8                 " keep 4 lines off the edges of the screen when scrolling

set hlsearch                    " highlight search terms, I leave the `hlsearch` with `vim-cool` plugin
set incsearch                   " show search matches as you type

set cmdheight=2                 " keep 2 lines for the command line

set wildignore=*.swp,*.bak,*.pyc,*.class
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep

set ignorecase
set smartcase

set nowrap
set lbr                         " only cutting the line on whitespace and not in the middle of a word
                                " works when the `set wrap` is enabled

set history=300                 " increase history (by default it is 20)

let g:mapleader=' '

" unmap all leader binding from <leader>
" as <leader> is space and it slows the INSERT MODE
imap <leader>


