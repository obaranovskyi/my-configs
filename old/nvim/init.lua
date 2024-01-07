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
require "plugin-configs.nvim-web-devicon"
require "plugin-configs.winresizer"
require "plugin-configs.surround"
require "plugin-configs.visual-multi"
require "plugin-configs.undotree"
require "plugin-configs.spelunker"
require "plugin-configs.quickscope"
require "plugin-configs.floaterm"
require "plugin-configs.marks"
require "plugin-configs.lualine"
require "plugin-configs.toggleterm"
require "plugin-configs.cheatsheet"
require "plugin-configs.luasnip"

-- Bufferline
require "plugin-configs.bufferline"

-- Diagnostics
require "plugin-configs.trouble"
require "plugin-configs.symbol-outline"

-- Quickfix list
require "plugin-configs.vim-grepper"
require "plugin-configs.vim-qf"

-- Refactoring
require "plugin-configs.camelsnek"

-- Telescope
require "telescope-setup"
require "plugin-configs.telescope-config"
require "plugin-configs.telescope-ctags"
require "plugin-configs.telescope-diff"

-- Yanks
require "plugin-configs.yanky"

-- Treesitter
require "plugin-configs.treesitter"

-- Formatter
require "plugin-configs.conform"

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

-- Smalls
require "plugin-configs.smalls"
-- require "plugin-configs.leap"

require "plugin-configs.scrollbar"
require "plugin-configs.hlslens"

-- Emmet
require "plugin-configs.emmet"

require "keymaps"

-- Commands
require "distance-actions.commands"

-- System
require "system.source"

-- Debugging
require "dap.python"
require "dap.bash"
require "dap.dap-ui"
require "dap.dap-virtual-text"
require "dap.dap-keymaps"

-- Mason lsp
require "lsp.init"

-- Vertical line
require "plugin-configs.neo-column"