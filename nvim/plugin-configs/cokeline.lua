local get_hex = require("cokeline.utils").get_hex
local active_bg_color = '#4c99e0'
local inactive_bg_color = get_hex('Normal', 'bg')
local bg_color = get_hex('ColorColumn', 'bg')

-- local start_icon = ''
-- local end_icon = ''
local start_icon = ''
local end_icon = ''

require('cokeline').setup({
      show_if_buffers_are_at_least = 1,
      mappings = {
          cycle_prev_next = true
      },
      default_hl = {
        bg = function(buffer)
          if buffer.is_focused then
            return active_bg_color
          end
        end,
      },
      components = {
          {
            text = function(buffer)
              local _text = ''
              if buffer.index > 1 then _text = ' ' end
              if buffer.is_focused or buffer.is_first then
                _text = _text .. start_icon
              end
              return _text
            end,
            fg = function(buffer)
              if buffer.is_focused then
                return active_bg_color
              elseif buffer.is_first then
                return inactive_bg_color
              end
            end,
            bg = function(buffer)
              if buffer.is_focused then
                if buffer.is_first then
                  return bg_color
                else
                  return inactive_bg_color
                end
              elseif buffer.is_first then
                  return bg_color
              end
            end
          },
          {
              text = function(buffer)
                  local status = ''
                  if buffer.is_readonly then
                      status = '➖'
                  elseif buffer.is_modified then
                      status = ''
                  end
                  return status
              end,
          },
          {
              text = function(buffer)
                  return " " .. buffer.devicon.icon
              end,
              fg = function(buffer)
                if buffer.is_focused then
                  return buffer.devicon.color
                end
              end
          },
          {
              text = function(buffer)
                return buffer.unique_prefix .. buffer.filename
              end,
              fg = function(buffer)
                  if(buffer.diagnostics.errors > 0) then
                      return '#910101'
                  end
              end,
              style = function(buffer)
                  local text_style = 'NONE'
                  if buffer.is_focused then
                      text_style = 'bold'
                  end
                  if buffer.diagnostics.errors > 0 then
                      if text_style ~= 'NONE' then
                          text_style = text_style .. ',underline'
                      else
                          text_style = 'underline'
                      end
                  end
                  return text_style
              end
          },
          {
              text = function(buffer)
                  local errors = buffer.diagnostics.errors
                  if(errors <= 9) then
                      errors = ' ' .. ''
                  else
                      errors = "🙃"
                  end
                  return errors .. ' '
              end,
              fg = function(buffer)
                if buffer.diagnostics.errors == 0 then
                  return '#3DEB63'
                elseif buffer.diagnostics.errors <= 9 then
                  return '#DB121B'
                end
              end
          },
          {
              text = '',
              delete_buffer_on_left_click = true
          },
          {
            text = function(buffer)
              if buffer.is_focused or buffer.is_last then
                return end_icon
              else
                return ' '
              end
            end,
            fg = function(buffer)
              if buffer.is_focused then
                return active_bg_color
              elseif buffer.is_last then
                return inactive_bg_color
              else
                return bg_color
              end
            end,
            bg = function(buffer)
              if buffer.is_focused then
                if buffer.is_last then
                  return bg_color
                else
                  return inactive_bg_color
                end
              elseif buffer.is_last then
                  return bg_color
              end
            end
          }
      },
  })
