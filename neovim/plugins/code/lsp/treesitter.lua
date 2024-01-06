return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      -- TODO: Add more languages
      ensure_installed = {
        "python",
        "lua",
        "vim",
        "vimdoc",
        "heex",
        "javascript",
        "typescript",
        "bash",
        "html"
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
