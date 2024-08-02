return {
	"scottmckendry/cyberdream.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("cyberdream").setup({
			transparent = true, -- Enable transparent background
			italic_comments = true, -- Enable italics comments

			-- Replace all fillchars with ' ' for the ultimate clean look
			hide_fillchars = false,

			-- Modern borderless telescope theme
			borderless_telescope = true,

			-- Set terminal colors used in `:terminal`
			terminal_colors = false,

			-- Use caching to improve performance - WARNING: experimental feature - expect the unexpected!
			-- Early testing shows a 60-70% improvement in startup time. YMMV. Disables dynamic light/dark theme switching.
			cache = false, -- generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache

			theme = {
				variant = "default", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
				highlights = {
					-- Highlight groups to override, adding new groups is also possible
					-- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

					-- Example:
					Comment = { fg = "#696969", bg = "NONE", italic = true },

					-- Complete list can be found in `lua/cyberdream/theme.lua`
				},

				-- Override a highlight group entirely using the color palette
				overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
					return {
						-- `:h highlight-groups` for a list of highlight groups

						-- DiffView overrides
						DiffText = { fg = "NONE", bg = "#026aba" },
						-- DiffChange = { fg = "NONE", bg = "#3b3a3a" },
						DiffChange = { fg = "NONE", bg = "#232423" },
						DiffDelete = { fg = "NONE", bg = "#3d0000" },
						DiffAdd = { fg = "NONE", bg = "#002e0c" },

						Search = { fg = "NONE", bg = "#174d52" },
						WildMenu = { fg = "NONE", bg = "#04693c" },

						CursorLine = { fg = "NONE", bg = "#242213" },
						Comment = { fg = colors.grey, bg = "NONE", italic = true },
						["@property"] = { fg = colors.magenta, bold = true },
					}
				end,

				-- Override a color entirely
				colors = {
					-- For a list of colors see `lua/cyberdream/colours.lua`
					-- Example:
					bg = "#000000",
					magenta = "#fc7ea2",
					purple = "#fc7ea2",
					orange = "#b3a6ff",
					-- cyan = "#92f3fc",
					cyan = "#acfca4",
					-- green = "#12ffd4",
					green = "#fff599",
					-- blue = "#00bbff",
					blue = "#92d4fc",
					fg = "#dad4fc",
					-- grey = "#9c9c9c",
				},
			},
		})
	end,
}
