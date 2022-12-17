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

