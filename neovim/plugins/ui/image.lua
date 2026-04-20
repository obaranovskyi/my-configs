-- TODO: Under construction
return {
	"3rd/image.nvim",
	dependencies = {
		"leafo/magick",
		"nvim-treesitter/nvim-treesitter",
		{
			"vhyrro/luarocks.nvim",
			opts = {
				rocks = {
					hererocks = true,
				},
			},
		},
	},
	config = function()
		require("image").setup({
			backend = "kitty",
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = true,
					filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
				},
			},
			tmux_show_only_in_active_window = true,
			hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif", "*.svg" },
		})
	end,
}
