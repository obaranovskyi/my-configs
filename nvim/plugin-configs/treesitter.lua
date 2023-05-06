local configs = require("nvim-treesitter.configs")

configs.setup {
  ensure_installed = "maintained",
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    -- INFO: This causes issues (uncomment when treesiter will fix it for nvim@0.8.0)
    --[[ enable = true, -- false will disable the whole extension ]]
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  -- indent = {
  --   enable = true,
  --   disable = { "yaml" },
  -- },
  context_commentingstring = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}


-- INFO: Don't show the warning when press `o`
-- PATCH: in order to address the message:
-- vim.treesitter.query.get_query() is deprecated, use vim.treesitter.query.get() instead. :help deprecated
--   This feature will be removed in Nvim version 0.10
local orig_notify = vim.notify
local filter_notify = function(text, level, opts)
  -- more specific to this case
  if type(text) == "string" and (string.find(text, "get_query", 1, true) or string.find(text, "get_node_text", 1, true)) then
  -- for all deprecated and stack trace warnings
  -- if type(text) == "string" and (string.find(text, ":help deprecated", 1, true) or string.find(text, "stack trace", 1, true)) then
    return
  end
  orig_notify(text, level, opts)
end
vim.notify = filter_notify
