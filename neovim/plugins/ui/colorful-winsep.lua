return {
  'nvim-zh/colorful-winsep.nvim',
  event = { "WinNew" },
  config = function()
    require("colorful-winsep").setup({
      highlight = "#1a1a24",
      interval = 30,
      no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
      symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
      close_event = function()
      end,
      create_event = function()
      end,
    })
  end
}
