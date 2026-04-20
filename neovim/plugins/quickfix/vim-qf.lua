return {
  'romainl/vim-qf',
  config = function()
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap

    keymap("n", "gs", ":.Reject<cr>", opts)
    keymap("x", "gs", ":Reject<cr>", opts)

    -- USAGE: 
    -- :Reject <value|range|regex> - to exclude 
    -- :Keep <value|range|regex> - to keep only 
    -- :Doline - cdo
    -- :Dofile - cfdo
  end
}
