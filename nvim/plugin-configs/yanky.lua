local mapping = require("yanky.telescope.mapping")

require('yanky').setup({
  highlight = {
    on_put = true,
    on_yank = true,
    timer = 100,
  },
  telescope = {
    mappings = {
      use_default_mappings = true, -- if default mappings should be used
      mappings = nil, -- nil to use default mappings or no mappings (see `use_default_mappings`)
    }
  },
})


local telescope = require("telescope")
telescope.load_extension("yank_history")

vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)")
-- vim.keymap.set({"n","x"}, "gp", "<Plug>(YankyGPutAfter)")
-- vim.keymap.set({"n","x"}, "gP", "<Plug>(YankyGPutBefore)")

vim.keymap.set("n", "gp", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "gn", "<Plug>(YankyNextEntry)")
vim.keymap.set("n", "gm", ":YankyClearHistory<CR>", { silent = true})

--[[ vim.keymap.set({"n", "v"}, "gf", telescope.extensions.yank_history.yank_history) ]]
vim.keymap.set({"v", "n"}, "gf", function()
  telescope.extensions.yank_history.yank_history()
  local keys = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
  vim.api.nvim_feedkeys(keys,'m',false)
end)
