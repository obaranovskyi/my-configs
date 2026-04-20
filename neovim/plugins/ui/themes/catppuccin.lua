return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    require('catppuccin').setup({
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        neotree = true,
        neogit = true,
        leap = true,
        mason = true,
        dap_ui = true,
        ufo = true,
        telescope = {
          enabled = true
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
      }
    })
  end
}
