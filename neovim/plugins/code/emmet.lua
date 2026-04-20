return {
  'mattn/emmet-vim',
  config = function()
    vim.cmd [[
      " let g:user_emmet_mode='n' " only enable in the normal mode
      " let g:user_emmet_leader_key=',' " emmet leader key

      imap j/ <C-y>,

      " to select from child to parent -> balancing 
      " <C-d> <C-d>
    ]]
  end
}
