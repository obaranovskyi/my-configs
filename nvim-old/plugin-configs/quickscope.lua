vim.cmd [[
  " Trigger a highlight in the appropriate direction when pressing these keys:

  let g:qs_highlight_on_keys = ['f', 'F']
  let g:qs_delay = 0

  " Updated highlight style
  highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

  " Disable the plugin when the length of line is longer than 150 (in our case)
  let g:qs_max_chars=150
]]
