" add ability to make bold markdown
" in visual mode -> select -> Sb
" or ysiwb

autocmd FileType markdown,octopress let b:surround_{char2nr('b')} = "**\r**"
