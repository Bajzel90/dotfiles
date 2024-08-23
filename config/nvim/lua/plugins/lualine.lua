return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "tokyonight",
				sections = {
					lualine_a = {
						file = 2,
					},
				},
			},
		})
	end,
}
