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
  indent = {
    enable = true,
    disable = { "yaml" },
  },
  context_commentingstring = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}



