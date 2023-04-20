local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- ------------------------------------------------
-- Common mappings
-- ------------------------------------------------
keymap("n", "Y", "yy", opts)

keymap("i", "jk", "<C-c>:w<cr>", opts)

keymap("i", "jl", "<Right>", opts)
keymap("i", "jL",  "<Esc>A", opts)
keymap("i", "jh", "<Left>", opts)
keymap("i", "jH",  "<Esc>I", opts)
keymap("i", "jj",  "<Esc>S", opts)
keymap("i", "jx",  "<Esc>lxi", opts)
keymap("i", "jd",  "<Esc>xi", opts)
keymap("i", "jn",  "<Esc>o", opts)
keymap("i", "jy",  "<Esc>O<Esc><Down>A", opts)
keymap("i", "jG",  "<Esc>Go", opts)
keymap("i", "jA",  "<Esc>ggO", opts)
keymap("i", "jf",  "<Esc>f", opts)
keymap("i", "jF",  "<Esc>F", opts)
keymap("i", "j>",  "<Esc>>>i", opts)
keymap("i", "j<",  "<Esc><<i", opts)
keymap("i", "jU",  "<Esc>gUiwea", opts)

keymap("n", "<leader><CR>", "r<CR><Esc>", opts)

keymap("n", "ga", "GVgg", opts)

keymap("n", "<leader><Esc>", ':let @/ = ""<CR>', opts)

-- ------------------------------------------------
-- Saving, Writing, Jumping into file mappings
-- ------------------------------------------------
keymap("n", "<leader>w", ":wa<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>ca", ":qa<CR>", opts)
keymap("n", "<leader>;", "gf", opts)

-- ------------------------------------------------
-- Clipboard mappings
-- ------------------------------------------------
keymap("n", "<leader>y", "\"*y", opts)
keymap("v", "<leader>y", "\"*y", opts)
keymap("n", "<leader>p", "\"+p", opts)
keymap("v", "<leader>p", "\"+p", opts)

-- ------------------------------------------------
-- Format the whole file
-- ------------------------------------------------
keymap("n", "<leader>=", "ga=", {})

-- ------------------------------------------------
-- Visual block movements
-- ------------------------------------------------
keymap("x", "K", ":move '<-2<CR>gv=gv", opts)
keymap("x", "J", ":move '>+1<CR>gv=gv", opts)

-- ------------------------------------------------
-- Windows mappings
-- ------------------------------------------------
keymap("n", "<leader>-", "<C-w>s", opts)
keymap("n", "<leader>\\", "<C-w>v", opts)


-- ------------------------------------------------
-- Magic search - no need to escape (`\`) every character
-- ------------------------------------------------
keymap("n", "<leader>/", ":s/\\v<Right>", { noremap = true })
keymap("x", "<leader>/", ":s/\\v<Right>", { noremap = true })

-- When pipenv is on navigation requires this mappings
keymap("n", "<C-h>", "<C-w>h", {})
keymap("n", "<C-l>", "<C-w>l", {})
keymap("n", "<C-j>", "<C-w>j", {})
keymap("n", "<C-k>", "<C-e>k", {})

-- ------------------------------------------------
-- Navigation
-- ------------------------------------------------
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- ------------------------------------------------
-- Buffers mappings
-- ------------------------------------------------
keymap("n", "gq", ":Bclose<CR>", opts)
keymap("n", "go", ":BufOnly<CR>", { noremap = true })
keymap("n", "<S-l>", ":bn<CR>", opts)
keymap("n", "<S-h>", ":bp<CR>", opts)

-- ------------------------------------------------
-- Quickfix list mappings
-- ------------------------------------------------
keymap("n", "ge", ":cnext<CR>", opts)
keymap("n", "gw", ":cprev<CR>", opts)
keymap("n", "gb", ":cfirst<CR>", opts)
keymap("n", "gl", ":clast<CR>", opts)
keymap("n", "gx", ":cclose<CR>", opts)

-- ------------------------------------------------
-- Command line mode navigation mappings
-- ------------------------------------------------
keymap("c", "<C-h>", "<Left>", {})
keymap("c", "<C-l>", "<Right>", {})
keymap("c", "<C-a>", "<Home>", {})
keymap("c", "<C-e>", "<End>", {})

-- ------------------------------------------------
-- Relative number toggle key mappings
-- ------------------------------------------------
keymap("n", "<leader>fn", ":set relativenumber!<CR>", opts)

-- ------------------------------------------------
-- NvimTree plugin mappings
-- ------------------------------------------------
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- ------------------------------------------------
-- Subversive alternative
-- ------------------------------------------------
vim.cmd [[
  nnoremap <expr> x SpecialChange()

  function! SpecialChange(type = '')
      if a:type == ''
          set opfunc=SpecialChange
          return 'g@'
      endif
      execute 'normal! `[v`]"_d"' .. v:register .. 'P'
  endfunction
]]

-- ------------------------------------------------
-- Ex command without jump
-- ------------------------------------------------
vim.cmd [[
  nnoremap <leader>ta :call ExCommandActionWithoutJump('')<Left><Left>

  function! ExCommandActionWithoutJump(command)
    execute ":norm! ml"
    execute ":" . a:command
    execute ":norm! `l"
    execute ":norm! :delm l"
  endfunction
]]

-- Note: To escape single quote : 'I''m John'
-- Note: Single quotes won't expand, use double quotes for "ci(\<cr>"
vim.cmd [[
  nnoremap <leader>te :call NormExCommandWithoutJump()<Left>

  function! NormExCommandWithoutJump(commandRange, command)
    execute ":norm! ml"
    execute ":" . a:commandRange . "norm! " . a:command
    execute ":norm! `l"
    execute ":norm! :delm l"
  endfunction
]]

-- ------------------------------------------------
-- Marks mappings
-- ------------------------------------------------
vim.cmd [[
  nnoremap 'a `A
  nnoremap 's `S
  nnoremap 'd `D
  nnoremap 'f `F
  nnoremap 'g `G

  nnoremap ma mA
  nnoremap ms mS
  nnoremap md mD
  nnoremap mf mF
  nnoremap mg mG

  nnoremap g'a g`A
  nnoremap g's g`S
  nnoremap g'd g`D
  nnoremap g'f g`F
  nnoremap g'g g`G
]]

-- ------------------------------------------------
-- File type mappings
-- ------------------------------------------------
keymap("n", "<leader>sb", ":set filetype=bash<CR>", opts)
