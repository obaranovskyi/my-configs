local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself

  use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"  -- Useful lua functions used ny lots of plugins
  use { 'iamcco/markdown-preview.nvim' }
  use 'tpope/vim-markdown'
  use "kyazdani42/nvim-web-devicons"
  use "windwp/nvim-autopairs" -- to be updated after cmp!!!
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use 'nvim-tree/nvim-tree.lua'
  use "moll/vim-bbye"
  use 'simeji/winresizer'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use { 'mg979/vim-visual-multi', branch = 'master' }
  use 'kamykn/spelunker.vim'
  use 'christoomey/vim-tmux-navigator'

  use 'unblevable/quick-scope'
  use 'chentoast/marks.nvim'
  use 'nvim-lualine/lualine.nvim'
  use "akinsho/toggleterm.nvim"
  use "sudormrfbin/cheatsheet.nvim"

  -- Quickfix list
  use 'romainl/vim-qf'    -- qflist manipulations
  use 'mhinz/vim-grepper' -- search

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'
  use "jemag/telescope-diff.nvim"

  -- Themes and UI elements (later)
  use 'dracula/vim'
  use 'folke/tokyonight.nvim'
  use 'sainnhe/sonokai'
  use 'savq/melange'
  use 'joshdick/onedark.vim'
  use 'drewtempelmeyer/palenight.vim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'marko-cerovac/material.nvim'
  use 'rebelot/kanagawa.nvim'

  -- Undotree
  use {
    "jiaoshijie/undotree",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }

  -- Bufferline
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  -- cmp plugins
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- Code formatting
  use "stevearc/conform.nvim"

  -- Snippets
  use "L3MON4D3/LuaSnip"
  use({ 'saadparwaiz1/cmp_luasnip' })

  -- Yank
  use "gbprod/yanky.nvim"

  -- snippets
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }

  -- Code assists
  use 'simrat39/symbols-outline.nvim'
  use 'folke/trouble.nvim'

  --Refactoring
  use 'nicwest/vim-camelsnek'

  -- ctags
  use 'fcying/telescope-ctags-outline.nvim'

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    branch = "0.5-compat",
  }
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"

  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "TimUntersberger/neogit"
  use "sindrets/diffview.nvim"

  -- Buffers
  use 'rbgrouleff/bclose.vim'
  use 'vim-scripts/BufOnly.vim'

  -- Smalls
  use 't9md/vim-smalls'
  -- The most interesting plugin
  -- use 'ggandor/leap.nvim'

  -- Scroll
  use "petertriho/nvim-scrollbar"

  -- Highlight search
  use {'kevinhwang91/nvim-hlslens'}

  -- Debugging
  use 'mfussenegger/nvim-dap'
  use 'mfussenegger/nvim-dap-python'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'

  -- Emet
  use 'mattn/emmet-vim'

  -- Motions
  use 'michaeljsmith/vim-indent-object'

  -- Vertical line
  use "ecthelionvi/NeoColumn.nvim"

  -- Not nvim package installation example:
  use 'lunarmodules/Penlight'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
