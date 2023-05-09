vim.cmd [[
  vnoremap <leader>ra "hy:%s/<C-r>h//gc \| :noh<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
  nnoremap <leader>ra "hyiw:%s/<C-r>h//gc \| :noh<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

  vnoremap <leader>ro "hy:%s/<C-r>h//g \| :noh<Left><Left><Left><Left><Left><Left><Left><Left><Left>
  nnoremap <leader>ro "hyiw:%s/<C-r>h//g \| :noh<Left><Left><Left><Left><Left><Left><Left><Left><Left>

  " --- Search and replace ---
  vnoremap ; :call Get_visual_selection()<cr>

  function! Get_visual_selection()
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]
    let lines = getline(lnum1, lnum2)
    let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)] 
    let lines[0] = lines[0][col1 - 1:] 
    let selection = join(lines,'\n')
    let change = input('Change the selection with: ')
    execute ":%s/".selection."/".change."/g"
  endfunction

  " Subtraction
  vnoremap <leader>rs "hy:%s/<C-r>h//gc<Left><Left><Left>
  nnoremap <leader>rs "hyiw:%s/<C-r>h//gc<Left><Left><Left>

  vnoremap <leader>ra "hy:%s/<C-r>h//gc \| :noh<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
  nnoremap <leader>ra "hyiw:%s/<C-r>h//gc \| :noh<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

  vnoremap <leader>ro "hy:%s/<C-r>h//g \| :noh<Left><Left><Left><Left><Left><Left><Left><Left><Left>
  nnoremap <leader>ro "hyiw:%s/<C-r>h//g \| :noh<Left><Left><Left><Left><Left><Left><Left><Left><Left>

  " NOTE: can be used with the `cgn` and `dgn`
  vnoremap <leader>rw /<C-r><C-w>
  nnoremap <leader>rw /<C-r><C-w>
  nnoremap <leader>rW /<C-r><C-a>

  " Repeat last substitution
  nnoremap & :&&<CR>:w<CR>
  xnoremap & :&&<CR>:w<CR>
]]
