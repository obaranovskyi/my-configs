call plug#begin('~/.vim/plugged')

" THEMES and VISUAL PLUGINS
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
Plug 'franbach/miramare'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
Plug 'mkitt/tabline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'vifm/vifm.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'mhinz/vim-startify'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'pacha/vem-tabline'

" FUNCTIONAL PLUGINS
Plug 'simeji/winresizer'
Plug 'chun-yang/auto-pairs'
Plug 'tpope/vim-repeat'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'plasticboy/vim-markdown'
Plug 'mattn/emmet-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'airblade/vim-gitgutter'
Plug 'liuchengxu/vim-which-key'
Plug 'rbgrouleff/bclose.vim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'mbbill/undotree'
Plug 'kamykn/spelunker.vim'
Plug 'romainl/vim-cool'
Plug 'svermeulen/vim-subversive'
Plug 'svermeulen/vim-yoink'
Plug '907th/vim-auto-save' " For now disabled, works bad along with prettier

" SEARCH, NAVIGATION AND REPLACEMENT PLUGINS 
Plug 'justinmk/vim-sneak'
Plug 'markonm/traces.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'mhinz/vim-grepper'
Plug 'unblevable/quick-scope'
Plug 'voldikss/vim-floaterm'
Plug 'dyng/ctrlsf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
