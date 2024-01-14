require 'configs.lazy'
require 'configs.leader'
require 'configs.keymaps'
require 'configs.options'
require 'configs.distance-actions.commands'
require 'configs.system.source'
require 'configs.registers'
require 'configs.search'


require("lazy").setup({
  'nvim-lua/popup.nvim',
  'christoomey/vim-tmux-navigator',
  'nvim-lua/plenary.nvim',
  'tpope/vim-markdown',
  'moll/vim-bbye',
  'tpope/vim-repeat',
  'rbgrouleff/bclose.vim',
  'vim-scripts/BufOnly.vim',
  'michaeljsmith/vim-indent-object',

  -- themes
  'folke/tokyonight.nvim',
  'dracula/vim',
  'sainnhe/sonokai',
  'savq/melange',
  'joshdick/onedark.vim',
  'drewtempelmeyer/palenight.vim',
  'marko-cerovac/material.nvim',

  { import = "plugins" },
  { import = "plugins.ui" },
  { import = "plugins.ui.themes" },
  { import = "plugins.telescope" },
  { import = "plugins.code" },
  { import = "plugins.code.lsp" },
  { import = "plugins.git" },
  { import = "plugins.quickfix" },
  { import = "plugins.navigation" },
}, {
  install = {
    colorscheme = { "nightfly" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  }
})

require 'configs.theme'
