return {
  'ggandor/leap.nvim',
  dependencies = {
    "tpope/vim-repeat"
  },
  config = function()
    vim.keymap.set('n', 's', function()
      local focusable_windows = vim.tbl_filter(
        function(win) return vim.api.nvim_win_get_config(win).focusable end,
        vim.api.nvim_tabpage_list_wins(0)
      )
      require('leap').leap { 
        target_windows = focusable_windows,
        opts = {
          -- Don't just to the first match
          safe_labels = {}
        }
      }

      -- Gray color for the rest
      vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
    end)

  end,
  lazy = false,
}
