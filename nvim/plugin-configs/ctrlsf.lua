vim.cmd [[
  nmap     <C-F>f <Plug>CtrlSFPrompt
  vmap     <C-F>f <Plug>CtrlSFVwordPath
  vmap     <C-F>F <Plug>CtrlSFVwordExec
  nmap     <C-F>n <Plug>CtrlSFCwordPath<CR>
  nmap     <C-F>p <Plug>CtrlSFPwordPath
  nnoremap <C-F>o :CtrlSFOpen<CR>
  nnoremap <C-F>t :CtrlSFToggle<CR>
  inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
  let g:ctrlsf_position = 'bottom'
  let g:ctrlsf_search_mode = 'async'
  let g:ctrlsf_winsize = '25%'
  let g:ctrlsf_default_view_mode = 'compact' " | normal 
  "  let g:ctrlsf_auto_focus = {
  "      \ "at": "start"
  "      \ }
  let g:ctrlsf_populate_qflist = 1
  let g:ctrlsf_mapping = {
      \ "next": "n",
      \ "prev": "N",
      \ }

  nnoremap gt :CtrlSFToggle<CR>
]]

