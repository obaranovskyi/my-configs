require "options"
require "plugins"
require "themes"

-- Set leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require "search"
require "registers"

-- Plugin configurations
require "plugin-configs.markdown-preview"
require "plugin-configs.markdown"
require "plugin-configs.highlightedyank"
require "plugin-configs.nvim-web-devicon"
require "plugin-configs.winresizer"
require "plugin-configs.surround"
require "plugin-configs.visual-multi"
require "plugin-configs.undotree"
require "plugin-configs.spelunker"
-- I'm using the custom mappings
-- require "plugin-configs.subversive" -- using custom key mappings
require "plugin-configs.yoink"
require "plugin-configs.quickscope"
require "plugin-configs.floaterm"
-- INFO: Now using vim-grepper
-- require "plugin-configs.ctrlsf"
require "plugin-configs.marks"
require "plugin-configs.lualine"
require "plugin-configs.toggleterm"
require "plugin-configs.cheatsheet"
require "plugin-configs.luasnip"

-- Bufferline
-- require "plugin-configs.cokeline"
require "plugin-configs.bufferline"

-- Diagnostics
require "plugin-configs.trouble"
require "plugin-configs.symbol-outline"

-- Quickfix list
require "plugin-configs.vim-grepper"
require "plugin-configs.vim-qf"

-- Refactoring
require "plugin-configs.camelsnek"

-- Tags
require "plugin-configs.telescope-ctags"

-- Telescope
require "telescope-setup"
require "plugin-configs.telescope-config"

-- Treesitter
require "plugin-configs.treesitter"

-- Autopairs
require "plugin-configs.autopairs"


-- Comments
require "plugin-configs.comments"

-- Git
require "plugin-configs.gitsigns"
require "plugin-configs.neogit"
require "plugin-configs.diffview"

-- NvimTree
require "plugin-configs.nvim-tree"

-- Sneak (I'm using Smalls instead)
-- require "plugin-configs.sneak"

-- Smalls
require "plugin-configs.smalls"

-- Emmet
require "plugin-configs.emmet"

require "keymaps"

-- Commands
require "distance-actions.commands"

-- Abbreviations (to expand <C-]>)
-- for now abbreviations doesn't work
require "abbreviations.abbreviations"

-- System
require "system.source"

-- Debugging
-- initialized before
-- require "dap.mason"
require "dap.python"
require "dap.bash"
require "dap.dap-ui"
require "dap.dap-virtual-text"
require "dap.dap-keymaps"

-- Mason lsp
require "lsp.init"

