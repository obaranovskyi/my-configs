vim.cmd [[
  let g:sneak#label = 1

  " case insensitive sneak
  "let g:sneak#use_ic_scs = 1

  " immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
  "let g:sneak#s_next = 1 " click s to go to next occurrence

  " remap so I can use , and ; with f and t
  map gS <Plug>Sneak_,
  map gs <Plug>Sneak_;

  " Change the colors
  highlight Sneak fg=black bg=#00C7DF ctermfg=black ctermbg=cyan
  highlight SneakScope fg=red bg=yellow ctermfg=red ctermbg=yellow
]]
