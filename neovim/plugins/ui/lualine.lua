return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      transparent_background = true,
      options = {
        icons_enabled = true,
        theme = 'tokyonight',
        -- theme = 'catppuccin',
        -- theme = 'palenight',
        -- theme = 'horizon',
        -- theme = 'dracula',
        -- theme = 'molokai',
        --[[ component_separators = { left = '', right = ''}, ]]
        --[[ section_separators = { left = '', right = ''}, ]]
        always_divide_middle = true,
        globalstatus = false,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = { 'quickfix' }
    }
  end
}
