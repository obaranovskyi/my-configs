return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'mfussenegger/nvim-dap-python',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-telescope/telescope-dap.nvim',
  },
  config = function()
    local map = function(lhs, rhs)
      vim.keymap.set("n", lhs, rhs, { silent = true })
    end

    local dap = require("dap")
    local dapui = require("dapui")

    map("<leader>dr", dap.continue)
    map("<leader>di", dap.step_into)
    map("<leader>do", dap.step_out)
    map("<leader>dn", dap.step_over)
    map("<leader>db", dap.toggle_breakpoint)
    map("<leader>dB", dap.set_breakpoint)
    map("<leader>dl", dap.run_last)
    map("<leader>ds", dap.repl.toggle)


    map("<leader>da", dapui.eval)
    map("<leader>dt", dapui.toggle)

    local run_debug_related = function()
      dapui.toggle()
      dap.continue()
    end

    map("<leader>dd", run_debug_related)
    vim.keymap.set("v", "<leader>da", dapui.eval, { silent = true })

    -- INFO: When you evaluate the expression the popup window will appear
    -- in order to jump into that window press the same eval keys
    -- like in the current case `<leader>da`

    -- INFO: Some config examples might be found here:
    -- https://github.com/mfussenegger/nvim-dap-python/issues/7

    dap.set_log_level('TRACE')

    dapui.setup({
      icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
      mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      expand_lines = vim.fn.has("nvim-0.7") == 1,
      layouts = {
        {
          elements = {
            "breakpoints",
            "stacks",
            { id = "scopes", size = 0.25 },
            "watches",
          },
          size = 60, -- 60 columns
          position = "left",
        },
        {
          elements = {
          },
          size = 0.25, -- 25% of total lines
          position = "bottom",
        },
      },
      controls = {
        enabled = true,
        element = "repl",
        icons = {
          pause = "",
          play = "",
          step_into = "",
          step_over = "",
          step_out = "",
          step_back = "",
          run_last = "↻",
          terminate = "□",
        },
      },
      floating = {
        max_height = nil,  -- These can be integers or a float between 0 and 1.
        max_width = nil,   -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      windows = { indent = 1 },
      render = {
        max_type_length = nil, -- Can be integer or nil.
        max_value_lines = 100, -- Can be integer or nil.
      }
    })

    require("nvim-dap-virtual-text").setup({
      enabled = true,                        -- enable this plugin (the default)
      enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
      highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
      highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
      show_stop_reason = true,               -- show stop reason when stopped for exceptions
      commented = false,                     -- prefix virtual text with comment string
      only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
      all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
      filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
      -- experimental features:
      virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
      all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
      virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
      virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
      -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
    })

    -- Debuggers
    require('debuggers.bash')
    -- require('debuggers.python')
    -- require('debuggers.nodejs')
  end
}
