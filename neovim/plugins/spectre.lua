return {
  'nvim-pack/nvim-spectre',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require('spectre').setup({
      default = {
        find = {
            cmd = "rg",
            options = {"no-ignore-case"}
        },
      }
    })

    vim.keymap.set('n', '<leader>rr', '<esc><cmd>lua require("spectre").toggle()<CR>', {
        desc = "Search current word"
    })
    vim.keymap.set('v', '<leader>rr', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
        desc = "Search current word"
    })
    vim.keymap.set('n', '<leader>rw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
        desc = "Search current word"
    })
    vim.keymap.set('n', '<leader>rp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
        desc = "Search on current file"
    })
  end
}
