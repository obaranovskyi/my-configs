-- More - https://github.com/stevearc/oil.nvim
return {
	"stevearc/oil.nvim",
	config = function()
		local oil = require("oil")
		oil.setup({
			keymaps = {
				["?"] = "actions.show_help",
				["."] = "actions.toggle_hidden",
				["q"] = "actions.close",
				["<S-u>"] = "actions.parent",
			},
		})

		-- NOTE: You can create the files like this
		-- my-component.component.{ts,html,scss}

		vim.keymap.set("n", "<leader>oo", ":Oil --float<CR>", { desc = "Open 'oil' in current directory" })

		-- ["g?"] = "actions.show_help",
		-- ["<CR>"] = "actions.select",
		-- ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
		-- ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
		-- ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
		-- ["<C-p>"] = "actions.preview",
		-- ["<C-c>"] = "actions.close",
		-- ["<C-l>"] = "actions.refresh",
		-- ["-"] = "actions.parent",
		-- ["_"] = "actions.open_cwd",
		-- ["`"] = "actions.cd",
		-- ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
		-- ["gs"] = "actions.change_sort",
		-- ["gx"] = "actions.open_external",
		-- ["g."] = "actions.toggle_hidden",
		-- ["g\\"] = "actions.toggle_trash",
	end,
}
