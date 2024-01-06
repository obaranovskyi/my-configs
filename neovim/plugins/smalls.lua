return {
  't9md/vim-smalls',
  config = function()
    local opts = { noremap = true, silent = true }

    -- Shorten function name
    local keymap = vim.api.nvim_set_keymap

    -- ------------------------------------------------
    -- Common mappings
    -- ------------------------------------------------
    keymap("n", "s", "<Plug>(smalls)", opts)
    vim.g.smalls_auto_jump = 1
    vim.g.smalls_auto_jump_min_input_length = 2
  end
}


-- Note: The most interesting plugin 'ggandor/leap.nvim'
