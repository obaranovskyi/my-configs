" ***********************************************
" Themes                                        *
" ***********************************************

"colorscheme gruvbox

"syntax on
"set t_Co=256
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm
"colorscheme onedark
"if (has("termguicolors"))
  "set termguicolors
"endif

colorscheme dracula
highlight VertSplit cterm=none gui=none
if (has("termguicolors"))
  set termguicolors
endif
hi Directory guifg=#7fa9f3
"hi Directory guifg=#FF0000 ctermfg=red

"source ~/my-configs/vim/plugins/miramare.vim
"colorscheme miramare
"if (has("termguicolors"))
  "set termguicolors
"endif

"set background=dark
"colorscheme palenight
"let g:airline_theme = "palenight"
"let g:palenight_terminal_italics = 1
"if (has("nvim"))
  ""For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  "let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"endif
""For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
""Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
 ""< https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"if (has("termguicolors"))
  "set termguicolors
"endif
