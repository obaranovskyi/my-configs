vim.cmd [[
  set nospell
  let g:enable_spelunker_vim = 1
  let g:spelunker_target_min_char_len = 3

  " " Override highlight setting.
  " highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#e64866
  " highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE

  let g:spelunker_max_hi_words_each_buf = 100
]]
