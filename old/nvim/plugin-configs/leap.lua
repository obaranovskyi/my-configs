local leap = require('leap')

leap.case_sensitive = false

leap.create_default_mappings()

vim.keymap.set("n", "s", function ()
  require('leap').leap { target_windows = { vim.api.nvim_get_current_win() } }
end)
