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
require "plugin-configs.markdown"
require "plugin-configs.cmp"
require "plugin-configs.highlightedyank"
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
require "plugin-configs.ctrlsf"
require "plugin-configs.marks"
require "plugin-configs.lualine"
require "plugin-configs.toggleterm"
require "plugin-configs.cheatsheet"
require "plugin-configs.cokeline"
require "plugin-configs.indent-blankline"

-- LSP
require "lsp.init"

-- Diagnostics
require "plugin-configs.trouble"
require "plugin-configs.symbol-outline"

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
require "commands.commands"

-- Abbreviations (to expand <C-]>)
-- for now abbreviations doesn't work
require "abbreviations.abbreviations"

-- System
require "system.source"

-- Debugging
require "dap.mason"
require "dap.python"
require "dap.bash"
require "dap.dap-ui"
require "dap.dap-virtual-text"
require "dap.dap-keymaps"

