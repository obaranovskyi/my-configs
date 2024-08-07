return {
	"ecthelionvi/NeoColumn.nvim",
	config = function()
		require("NeoColumn").setup({
			fg_color = "transparent",
			-- bg_color = "#4287f5",
			bg_color = "#2a4259",
			NeoColumn = "120",
			always_on = true,
			custom_NeoColumn = {},
			excluded_ft = { "text", "markdown", "dashboard" },
		})
	end,
}
