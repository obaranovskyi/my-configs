local mapping = require("yanky.telescope.mapping")
local actions = require "telescope.actions"
local utils = require("yanky.utils")

local telescope = require("telescope")
telescope.load_extension("yank_history")

require('yanky').setup({
  highlight = {
    on_put = true,
    on_yank = true,
    timer = 100,
  },
  picker = {
    telescope = {
      mappings = {
        default = mapping.put("p"),
        i = {
          ["<c-j>"] = actions.move_selection_next,
          ["<c-k>"] = actions.move_selection_previous,
          ["<C-n>"] = actions.move_selection_next,
          ["<C-p>"] = actions.move_selection_previous,

          ["<c-g>"] = mapping.put("p"),
          ["<c-x>"] = mapping.delete(),
          ["<c-r>"] = mapping.set_register(utils.get_default_register()),
        },
        n = {
          p = mapping.put("p"),
          P = mapping.put("P"),
          d = mapping.delete(),
          r = mapping.set_register(utils.get_default_register())
        },
      }
    }
  },
})


vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)")
-- vim.keymap.set({"n","x"}, "gp", "<Plug>(YankyGPutAfter)")
-- vim.keymap.set({"n","x"}, "gP", "<Plug>(YankyGPutBefore)")

vim.keymap.set("n", "gj", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "gk", "<Plug>(YankyNextEntry)")
vim.keymap.set("n", "gm", ":YankyClearHistory<CR>", { silent = true})

vim.keymap.set({"n", "v"}, "gf", telescope.extensions.yank_history.yank_history)

-- vim.keymap.set({"v", "n"}, "gf", function()
--   telescope.extensions.yank_history.yank_history()
--   local keys = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
--   vim.api.nvim_feedkeys(keys,'m',false)
-- end)
