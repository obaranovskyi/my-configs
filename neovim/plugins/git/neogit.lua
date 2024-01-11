return {
  'TimUntersberger/neogit',
  dependencies = {
    "nvim-lua/plenary.nvim",  -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = function()
    require("neogit").setup({
      disable_commit_configuration = true,
      enhanced_diff_hl = true,
      integrations = {
        diffview = true
      }
    })

    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap

    keymap("n", "<leader>gg", ":Neogit<CR>", opts)
  end
}
