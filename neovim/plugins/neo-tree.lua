return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim"
  },
  config = function()
    require("neo-tree").setup({
      use_default_mappings = false,
      buffers = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
      },
      window = {
        position = 'right',
        width = 40,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["<space>"] = {
            "toggle_node",
            nowait = false,
          },

          ["."] = "set_root",
          ["/"] = "fuzzy_finder",
          ["o"] = "open",
          ["l"] = "open",
          ["<cr>"] = "open",
          ["h"] = "close_node",
          ["c"] = "copy_to_clipboard",
          ["U"] = "navigate_up",
          ["<esc>"] = "cancel", -- close preview or floating neo-tree window
          ["S"] = "open_split",
          ["v"] = "open_vsplit",
          ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
          ["I"] = "focus_preview",
          ["H"] = "toggle_hidden",
          ["t"] = "open_tabnew",
          ["w"] = "open_with_window_picker",
          ["z"] = "close_all_nodes",
          ["Z"] = "expand_all_nodes",
          ["a"] = {
            "add",
            -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
            -- some commands may take optional config options, see `:h neo-tree-mappings` for details
            config = {
              show_path = "none" -- "none", "relative", "absolute"
            }
          },
          ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
          ["d"] = "delete",
          ["r"] = "rename",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
          ["q"] = "close_window",
          ["R"] = "refresh",
          ["?"] = "show_help",
          ["<"] = "prev_source",
          [">"] = "next_source",
          ["i"] = "show_file_details",

          ["D"] = "diff_files", -- INFO: Open two files with by hitting D and D on two different files

          ["[g"] = "prev_git_modified",
          ["]g"] = "next_git_modified",
          ["f"] = "filter_on_submit",
          ["<C-x>"] = "clear_filter",

          ["<tab>"] = function(state) -- INFO: Open file without losing sidebar focus
            state.commands["open"](state)
            vim.cmd("Neotree reveal")
          end,
        },
        fuzzy_finder_mappings = { -- INFO: define keymaps for filter popup window in fuzzy_finder_mode
          ["<down>"] = "move_cursor_down",
          ["<C-n>"] = "move_cursor_down",
          ["<C-j>"] = "move_cursor_down",
          ["<up>"] = "move_cursor_up",
          ["<C-p>"] = "move_cursor_up",
          ["<C-k>"] = "move_cursor_up",
        },
      },
      commands = {
        diff_files = function(state)
          local node = state.tree:get_node()
          local log = require("neo-tree.log")
          state.clipboard = state.clipboard or {}
          if diff_Node and diff_Node ~= tostring(node.id) then
            local current_Diff = node.id
            require("neo-tree.utils").open_file(state, diff_Node, open)
            vim.cmd("vert diffs " .. current_Diff)
            log.info("Diffing " .. diff_Name .. " against " .. node.name)
            diff_Node = nil
            current_Diff = nil
            state.clipboard = {}
            require("neo-tree.ui.renderer").redraw(state)
          else
            local existing = state.clipboard[node.id]
            if existing and existing.action == "diff" then
              state.clipboard[node.id] = nil
              diff_Node = nil
              require("neo-tree.ui.renderer").redraw(state)
            else
              state.clipboard[node.id] = { action = "diff", node = node }
              diff_Name = state.clipboard[node.id].node.name
              diff_Node = tostring(state.clipboard[node.id].node.id)
              log.info("Diff source file " .. diff_Name)
              require("neo-tree.ui.renderer").redraw(state)
            end
          end
        end
      }
    })

    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap

    -- INFO: Sometimes it's just stops working
    function neotree_auto_focus_in_tree()
      local buffer_name = vim.api.nvim_buf_get_name(0)
      local do_not_open = false

      local buffer_list = vim.api.nvim_list_bufs()
      for _, buf in ipairs(buffer_list) do
        local buf_name = vim.api.nvim_buf_get_name(buf)
        local buf_exclude_list = { 'diffview', 'spectre', 'OUTLINE'}
        for _, buf_to_exclude in ipairs(buf_exclude_list) do
          if string.find(buf_name, buf_to_exclude) then
            do_not_open = true
          end
        end
      end

      if buffer_name ~= nil and
         buffer_name ~= '' and
         not do_not_open
      then
        vim.cmd(':Neotree reveal')
        vim.cmd('wincmd h')
      end
    end

    local neoTreeAutoOpen = vim.api.nvim_create_augroup("NeoTreeAutoOpen", { clear = true })
    -- To just open and not jump use 'BufRead'
    vim.api.nvim_create_autocmd("BufWinEnter", {
      command = 'lua neotree_auto_focus_in_tree()',
      group = neoTreeAutoOpen
    })
    -- TODO: end

    function neotree_open_file()
      vim.cmd('wincmd l')
      vim.cmd('wincmd l')
      vim.cmd('call feedkeys("/")')
    end

    keymap('n', '<leader>o', ':Neotree<CR>:lua neotree_open_file()<cr>', opts)

    keymap('n', '<C-n>', ":Neotree toggle<CR>", opts)

    -- INFO: Manually focus current buffer file in the tree
    keymap('n', '<leader>n', ":Neotree reveal<CR>", opts)

    -- INFO: Open tree on start
    -- vim.cmd [[ :Neotree<CR> ]]
  end
}
