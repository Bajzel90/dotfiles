return {
	{
		"SCJangra/table-nvim",
		ft = "markdown",
		opts = {
			mappings = { -- next and prev work in Normal and Insert mode. All other mappings work in Normal mode.
				next = "<TAB>", -- Go to next cell.
				prev = "<S-TAB>", -- Go to previous cell.
			},
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		lazy = true,
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = function()
			require("lazy").load({ plugins = { "markdown-preview.nvim" } })
			vim.fn["mkdp#util#install"]()
		end,
		keys = {
			{
				"<leader>mp",
				ft = "markdown",
				"<cmd>MarkdownPreviewToggle<cr>",
				desc = "Markdown Preview",
			},
		},
		config = function()
			vim.cmd([[do FileType]])
		end,
	},
	{
		"tadmccorkle/markdown.nvim",
		ft = "markdown", -- or 'event = "VeryLazy"'
		opts = {},
	},
	{
		"MeanderingProgrammer/markdown.nvim",
		ft = "markdown", -- or 'event = "VeryLazy"'
		name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		main = "render-markdown",
		opts = {
			code = {
				width = "block",
				right_pad = 1,
			},
			heading = {
				sign = false,
				icons = {},
			},
			bullet = { enabled = true, icons = { "", "" } },
			render_modes = { "n", "c", "t" },
		},
	},
	{
		"Zeioth/markmap.nvim",
		lazy = true,
		build = "yarn global add markmap-cli",
		cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },
		opts = {
			html_output = "/tmp/markmap.html", -- (default) Setting a empty string "" here means: [Current buffer path].html
			hide_toolbar = false, -- (default)
			grace_period = 3600000, -- (default) Stops markmap watch after 60 minutes. Set it to 0 to disable the grace_period.
		},
		config = function(_, opts)
			require("markmap").setup(opts)
		end,
	},
}
