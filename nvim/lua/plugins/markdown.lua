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
				-- icons = { "🌟", "🌟🌟", "🌟🌟🌟", "🌟🌟🌟🌟", "🌟🌟🌟🌟🌟", "🌟🌟🌟🌟🌟🌟" },
				icons = {},
			},
			ft = { "markdown", "norg", "rmd", "org" },
			-- heading = {
			-- 	sign = true,
			-- 	-- Determines how icons fill the available space:
			-- 	--  inline:  underlying '#'s are concealed resulting in a left aligned icon
			-- 	--  overlay: result is left padded with spaces to hide any additional '#'
			-- 	position = "overlay",
			-- 	-- Replaces '#+' of 'atx_h._marker'
			-- 	-- The number of '#' in the heading determines the 'level'
			-- 	-- The 'level' is used to index into the array using a cycle
			-- 	icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
			-- 	-- Added to the sign column if enabled
			-- 	-- The 'level' is used to index into the array using a cycle
			-- 	signs = { "󰫎 " },
			-- 	-- Width of the heading background:
			-- 	--  block: width of the heading text
			-- 	--  full:  full width of the window
			-- 	-- Can also be an array of the above values in which case the 'level' is used
			-- 	-- to index into the array using a clamp
			-- 	width = "block",
			-- 	-- Amount of padding to add to the left of headings
			-- 	left_pad = 0,
			-- 	-- Amount of padding to add to the right of headings when width is 'block'
			-- 	right_pad = 3,
			-- 	-- Minimum width to use for headings when width is 'block'
			-- 	min_width = 0,
			-- 	-- Determins if a border is added above and below headings
			-- 	border = false,
			-- 	-- Highlight the start of the border using the foreground highlight
			-- 	border_prefix = false,
			-- 	-- Used above heading for border
			-- 	above = "▄",
			-- 	-- Used below heading for border
			-- 	below = "▀",
			-- },
		},
	},
	{
		"Zeioth/markmap.nvim",
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
	{
		"Nedra1998/nvim-mdlink",
		opts = {},
		config = function()
			local mdlink = require("nvim-mdlink")

			vim.api.nvim_create_user_command("FollowMarkdownLink", mdlink.follow, {})
			vim.api.nvim_set_keymap("n", "<leader>ml", ":FollowMarkdownLink<CR>", { noremap = true })
		end,
	},
}
