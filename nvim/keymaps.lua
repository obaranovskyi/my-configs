local opts = { noremap = true, silent = true }
local opt_nr = { noremap = true }

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

keymap("i", "<C-a>", "<Esc>I", opts)
keymap("i", "<C-e>", "<Esc>A", opts)
keymap("i", "<C-h>", "<Esc>bi", opts)
keymap("i", "<C-l>", "<Esc>elli", opts)
keymap("i", "<C-d>", "<Esc>ldli", opts)


keymap("i", "j0", "<C-r>0", opts)
keymap("i", "j8", "<Esc>\"*pa", opts)

keymap("n", "<leader><CR>", "r<CR><Esc>", opts)

keymap("n", "ga", "GVgg", opts)

keymap("n", "<leader><Esc>", ':let @/ = ""<CR>', opts)

-- ------------------------------------------------
-- Saving, Writing, Jumping into file mappings
-- ------------------------------------------------
keymap("n", "<leader>w", ":wa<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>cz", ":qa<CR>", opts)
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
keymap("n", "<leader>/", ":s/\\v", { noremap = true })
keymap("x", "<leader>/", ":s/\\v", { noremap = true })

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
keymap("n", "gw", ":cprev<CR>", opts)
keymap("n", "ge", ":cnext<CR>", opts)
keymap("n", "gW", ":cfirst<CR>", opts)
keymap("n", "gE", ":clast<CR>", opts)
keymap("n", "gx", ":copen<CR>", opts)
keymap("n", "gt", ":cclose<CR>", opts)
keymap("n", "gL", ":cdo s///g | update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>", opt_nr)

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
  function! ExCommandWithoutJump(command)
    try
      execute ":norm! ml"
      execute ":" . a:command
      execute ":norm! `l"
      execute ":delm l"
    catch /.*/
      " Suppress the following errors:
      "   - Line where was mark was removed
      "   - Wrong range entered - No need to echo the error,
      "     as there will be no effect
    endtry
  endfunction

  nnoremap <leader>ta :call ExCommandWithoutJump('')<Left><Left>
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
keymap('n', "'a", '`A', opt_nr)
keymap('n', "'s", '`S', opt_nr)
keymap('n', "'d", '`D', opt_nr)
keymap('n', "'f", '`F', opt_nr)
keymap('n', "'g", '`G', opt_nr)

keymap('n', 'ma', 'mA', opt_nr)
keymap('n', 'ms', 'mS', opt_nr)
keymap('n', 'md', 'mD', opt_nr)
keymap('n', 'mf', 'mF', opt_nr)
keymap('n', 'mg', 'mG', opt_nr)

keymap('n', "g'a", 'g`A', opt_nr)
keymap('n', "g's", 'g`S', opt_nr)
keymap('n', "g'd", 'g`D', opt_nr)
keymap('n', "g'f", 'g`F', opt_nr)
keymap('n', "g'g", 'g`G', opt_nr)

-- ------------------------------------------------
-- File type mappings
-- ------------------------------------------------
keymap("n", "<leader>sb", ":set filetype=bash<CR>", opts)

-- ------------------------------------------------
-- Indent
-- ------------------------------------------------
keymap("n", ">", ">>", opts)
keymap("n", "<", "<<", opts)
