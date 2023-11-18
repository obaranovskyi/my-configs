-- :help options
vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.encoding = "utf-8"
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.incsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.smartcase = true                        -- smart case - perform a case insensitive search when you enter all lowercase characters
                                                -- and perform case sensitive search when you enter one or more uppercase characters.
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.undofile = true                         -- enable persistent undo

vim.opt.scrolloff = 8                           -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.swapfile = false                        -- creates a swapfile

vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2                             -- insert 2 spaces for a tab
vim.opt.softtabstop = 2
vim.opt.smartindent = true                   -- make indenting smarter again (works wrong)

vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true                   -- set relative numbered lines
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.numberwidth = 4                         -- set number column width to 2 {default 4}
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.hidden = true                           -- Do not close buffers (better to use with bclose plugin)
vim.opt.autoread = true                         -- If file will be changed it'll be auto reloaded
-- vim.opt.statuscolumn = " %l %r "               -- double numbers (regular and relative)
-- vim.opt.statuscolumn = "%l %r %s"            -- double numbers (regular and relative) and error (issue)

-- Hide ~ sign on the lines where is no text ]]
vim.cmd [[ set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾ ]]

-- hidden characters
vim.opt.encoding="utf-8"
--[[ vim.opt.list = true ]]
--[[ vim.opt.listchars="tab:>.,trail:~,extends:>,precedes:<,space:." ]]
--example
--[[ vim.opt.listchars="eol:~,tab:>.,trail:~,extends:>,precedes:<,space:_" ]]

-- color programming languages in the markdown
vim.cmd [[
  let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'typescript', 'vim', 'css']
]]

-- float style (lsp)
vim.opt.linebreak = true


vim.cmd [[
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=bash | endif
]]
