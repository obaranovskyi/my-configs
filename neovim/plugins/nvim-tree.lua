-- TODO: Add files like in terminal test.{ts,css,html}
-- TODO: Diff two files
-- TODO: Multi movement with v
return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		local HEIGHT_RATIO = 0.8 -- You can change this
		local WIDTH_RATIO = 0.5 -- You can change this too
		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true

		-- More info about `on_attach` and mappings here:
		-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Migrating-To-on_attach
		local function on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return {
					desc = "nvim-tree: " .. desc,
					buffer = bufnr,
					noremap = true,
					silent = true,
					nowait = true,
				}
			end

			-- BEGIN_DEFAULT_ON_ATTACH
			vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
			vim.keymap.set("n", "<C-e>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
			--[[ vim.keymap.set('n', '<C-k>', api.node.show_info_popup,              opts('Info')) ]]
			vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
			vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
			vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
			vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
			vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
			vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
			vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
			vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
			vim.keymap.set("n", ".", api.node.run.cmd, opts("Run Command"))
			vim.keymap.set("n", "a", api.fs.create, opts("Create"))
			vim.keymap.set("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
			vim.keymap.set("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle No Buffer"))
			vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
			vim.keymap.set("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Git Clean"))
			vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
			vim.keymap.set("n", "]c", api.node.navigate.git.next, opts("Next Git"))
			vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
			vim.keymap.set("n", "D", api.fs.trash, opts("Trash"))
			vim.keymap.set("n", "E", api.tree.expand_all, opts("Expand All"))
			vim.keymap.set("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
			vim.keymap.set("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
			vim.keymap.set("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
			vim.keymap.set("n", "F", api.live_filter.clear, opts("Clean Filter"))
			vim.keymap.set("n", "f", api.live_filter.start, opts("Filter"))
			vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
			vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
			vim.keymap.set("n", "H", function()
				api.tree.toggle_gitignore_filter()
				api.tree.toggle_hidden_filter()
			end, opts("Toggle Dotfiles"))

			-- vim.keymap.set('n', 'tg', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
			vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
			vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
			vim.keymap.set("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
			vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
			vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
			vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
			vim.keymap.set("n", "q", api.tree.close, opts("Close"))
			vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
			vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
			-- vim.keymap.set('n', 's', '', opts('Run System'))
			vim.keymap.set("n", "S", api.tree.search_node, opts("Search"))
			vim.keymap.set("n", "U", api.tree.toggle_custom_filter, opts("Toggle Hidden"))
			vim.keymap.set("n", "W", api.tree.collapse_all, opts("Collapse"))
			vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
			vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
			vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))

			-- INFO: Add files from the terminal
			vim.keymap.set("n", "N", function()
				local node = api.tree.get_node_under_cursor()
				local curr_path = node.absolute_path
				return ":!touch " .. curr_path .. "/"
			end, { expr = true, silent = true })
			-- INFO: Add directories from the terminal
			vim.keymap.set("n", "M", function()
				local node = api.tree.get_node_under_cursor()
				local curr_path = node.absolute_path
				return ":!mkdir -p " .. curr_path .. "/"
			end, { expr = true, silent = true })

			vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "U", function()
				api.tree.change_root_to_parent()

				-- INFO: Line above doesn't change the root folder
				-- this is workaround
				local node = api.tree.get_node_under_cursor()
				local curr_path = node.parent.absolute_path
				vim.cmd(":cd " .. curr_path)
			end, opts("Up"))
			vim.keymap.set("n", ".", function()
				api.tree.change_root_to_node()

				-- INFO: Line above doesn't change the root folder
				-- this is workaround
				local node = api.tree.get_node_under_cursor()
				local curr_path = node.parent.absolute_path
				vim.cmd(":cd " .. curr_path)
			end, opts("CD"))
			vim.keymap.set("n", "U", api.tree.change_root_to_parent, opts("CD"))

			-- You will need to insert "your code goes here" for any mappings with a custom action_cb
			vim.keymap.set("n", "A", api.tree.expand_all, opts("Expand All"))
			vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
			vim.keymap.set("n", "C", api.tree.change_root_to_node, opts("CD"))
			vim.keymap.set("n", "P", function()
				local node = api.tree.get_node_under_cursor()
				print(node.absolute_path)
			end, opts("Print Node Path"))

			vim.keymap.set("n", "Z", api.node.run.system, opts("Run System"))
		end

		nvim_tree = require("nvim-tree")

		nvim_tree.setup({
			auto_reload_on_write = true,
			create_in_closed_folder = false,
			disable_netrw = false,
			hijack_cursor = false,
			hijack_netrw = true,
			hijack_unnamed_buffer_when_opening = false,
			open_on_tab = false,
			sort_by = "name",
			update_cwd = true,
			reload_on_bufenter = false,
			respect_buf_cwd = false,
			sync_root_with_cwd = true,
			on_attach = on_attach,
			view = {
				side = "left",
				adaptive_size = false,
				centralize_selection = true,
				width = 35,
				preserve_window_proportions = false,
				number = false,
				relativenumber = false,
				signcolumn = "yes",
			},
			renderer = {
				add_trailing = false,
				group_empty = false,
				highlight_git = true,
				full_name = false,
				highlight_opened_files = "all",
				root_folder_modifier = ":~",
				root_folder_label = function(path)
					return vim.fn.fnamemodify(path, ":t")
				end,
				indent_markers = {
					enable = true,
					icons = {
						corner = "└ ",
						edge = "│ ",
						item = "│ ",
						none = "  ",
					},
				},
				icons = {
					webdev_colors = true,
					git_placement = "before",
					padding = " ",
					symlink_arrow = " ➛ ",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_closed = "",
							arrow_open = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
				special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
			},
			hijack_directories = {
				enable = true,
				auto_open = true,
			},
			update_focused_file = {
				enable = true,
				update_cwd = false,
				ignore_list = {},
			},
			system_open = {
				cmd = "",
				args = {},
			},
			diagnostics = {
				enable = false,
				show_on_dirs = false,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			filters = {
				dotfiles = true,
				custom = {},
				exclude = {},
			},
			filesystem_watchers = {
				enable = false,
			},
			git = {
				enable = true,
				ignore = true,
				timeout = 400,
			},
			notify = {
				threshold = vim.log.levels.OFF, -- INFO: Disable notifications
				absolute_path = true,
			},
			actions = {
				use_system_clipboard = true,
				change_dir = {
					enable = true,
					global = true,
					restrict_above_cwd = false,
				},
				expand_all = {
					max_folder_discovery = 300,
				},
				open_file = {
					quit_on_open = false,
					resize_window = true,
					window_picker = {
						enable = true,
						chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
						exclude = {
							filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
							buftype = { "nofile", "terminal", "help" },
						},
					},
				},
				remove_file = {
					close_window = true,
				},
			},
			trash = {
				cmd = "gio trash",
				require_confirm = true,
			},
			live_filter = {
				prefix = "[FILTER]: ",
				always_show_folders = false,
			},
			log = {
				enable = false,
				truncate = false,
				types = {
					all = false,
					config = false,
					copy_paste = false,
					diagnostics = false,
					git = false,
					profile = false,
					watcher = false,
				},
			},
		})

		local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
		if not config_status_ok then
			return
		end
	end,
}
