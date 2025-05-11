return {
	{
		"echasnovski/mini.nvim",
		version = false,
		enabled = true,
		config = function()
			require("mini.statusline").setup({ use_icons = true })
			require("mini.surround").setup()
			require("mini.ai").setup()
			require("mini.pairs").setup()
			require("mini.files").setup()
		end,
		keys = {
			{
				"<leader>fm",
				function()
					require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
				end,
				desc = "Open mini.files (Directory of Current File)",
			},
			{
				"<leader>fM",
				function()
					require("mini.files").open(vim.uv.cwd(), true)
				end,
				desc = "Open mini.files (cwd)",
			},
		},
	},
}
