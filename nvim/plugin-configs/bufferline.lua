vim.opt.termguicolors = true

require("bufferline").setup({
  options = {
    separator_style = "slant", -- "slope",
    diagnostics = "nvim_lsp"
  }
})
