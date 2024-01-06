return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup({
      options = {
        themable = false,
        -- separator_style = 'slant',
        separator_style = "slope",
        diagnostics = "nvim_lsp"
      }
    })
  end
}


