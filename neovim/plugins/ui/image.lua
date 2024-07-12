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
		require("image").setup({})
	end,
}
