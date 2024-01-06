return {
  'simrat39/symbols-outline.nvim',
  config = function()
    require('symbols-outline').setup({
      highlight_hovered_item = false,
      position = 'left',
      width = 18,
      autofold_depth = 2,
      keymaps = {
        close = "<space>q"
      }
    })

    vim.api.nvim_set_keymap(
      'n',
      '<leader>fw',
      ':SymbolsOutline<CR>',
      { noremap = true, silent = true })
  end
}
