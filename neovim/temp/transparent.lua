return {
  'xiyaowong/transparent.nvim',
  config = function()
    local transparent = require('transparent')
    transparent.setup({
      transparent = vim.g.transparent_enabled
    })
    transparent.clear_prefix('Telescope')
    transparent.clear_prefix('NeoTree')
    transparent.clear_prefix('lualine')
    transparent.clear_prefix('BufferLine')
  end
}
