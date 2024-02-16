return {
  'nvim-telescope/telescope.nvim',
  config = function()
    local telescope = require('telescope')

    telescope.load_extension('media_files')

    local actions = require "telescope.actions"

    telescope.setup {
      defaults = {

        file_ignore_patterns = {"node_modules", "dist"},
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },

        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,

            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,

            ["<C-c>"] = actions.close,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,

            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-l>"] = actions.complete_tag,
            ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
          },

          n = {
            ["<esc>"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- TODO: This doesn't work and has to be updated

            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["H"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["L"] = actions.move_to_bottom,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,

            ["?"] = actions.which_key,
          },
        },
      },
      pickers = {
        -- search through hidden files as well
        -- live_grep = {
        --   additional_args = function(opts)
        --     return {"--hidden"}
        --   end
        -- },
      },
      extensions = {
        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = {"png", "webp", "jpg", "jpeg"},
            find_cmd = "rg" -- find command (defaults to `fd`)
          }
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
      },
    }

    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap

    -- INFO: There are few Telescope themes
    -- * ivy
    -- * dropdown
    -- * cursor

    -- CONF: Show with file content
    keymap("n", "<C-p>", ":Telescope find_files hidden=true<CR>", opts)
    -- CONF: Show with file content as a dropdown
    --[[ keymap("n", "<leader>e", ":Telescope find_files theme=dropdown<CR>", opts) ]]
    -- CONF: Show without file content
    keymap("n", "<leader>e", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false, hidden = false, cwd = '.' }))<cr>", opts)

    -- Show with particular theme
    --[[ keymap("n", "<leader>g", ":Telescope live_grep theme=dropdown<CR>", opts) ]]
    keymap("n", "<leader>ff", ":Telescope live_grep theme=ivy<CR>", opts)
    keymap("n", "<leader>fj", ":Telescope jumplist<CR>", opts)


    -- INFO: grep_string() fn helps to fin
    -- INFO: Now using vim-grepper for this goal
    -- keymap('n', 'g;', "<cmd>lua require'telescope.builtin'.grep_string()<cr>", opts)
    -- keymap('x', 'g;', "<cmd>lua require'telescope.builtin'.grep_string()<cr>", opts)
  end
}
