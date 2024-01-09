return {
  'lewis6991/gitsigns.nvim',
  config = function()
    local gitsigns = require("gitsigns")

    gitsigns.setup {
      signs = {
        add          = { text = '▋' }, -- Solid vertical bar
        change       = { text = '▋' }, -- Solid vertical bar
        delete       = { text = '_' }, -- Standard hyphen
        topdelete    = { text = '¯' }, -- Macron
        changedelete = { text = '≈' }, -- Almost equal to
        untracked    = { text = '¦' }, -- Broken vertical bar
        --[[ change       = { text = '△' },   -- Triangle with space ]]
        --[[ delete       = { text = '✖' },   -- Multiplication sign with space ]]
        --[[ topdelete    = { text = '¯' },   -- Macron with space ]]
        --[[ changedelete = { text = '≈' },   -- Almost equal to with space ]]
        --[[ untracked    = { text = '⚠' },   -- Warning sign with space ]]
      },
      -- signs = {
      --   add          = { hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
      --   change       = { hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
      --   delete       = { hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
      --   topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
      --   changedelete = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
      --   untracked    = { hl = 'GitSignsAdd'   , text = '┆', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
      -- },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false,   -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false,  -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 500,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000,
      preview_config = {
        -- Options passed to nvim_open_win
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      yadm = {
        enable = false,
      },
    }


    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap

    keymap('n', '<leader>gdd', ':Gitsigns diffthis<CR>', opts)
    keymap('n', '<leader>gdb', ':Gitsigns blame_line<CR>', opts)
  end
}
