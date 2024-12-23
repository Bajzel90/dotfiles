return {
	{
		"SCJangra/table-nvim",
		ft = "markdown",
		opts = {
			mappings = { -- next and prev work in Normal and Insert mode. All other mappings work in Normal mode.
				next = "<TAB>", -- Go to next cell.
				prev = "<S-TAB>", -- Go to previous cell.
				-- insert_row_up = "<A-k>", -- Insert a row above the current row.
				-- insert_row_down = "<A-j>", -- Insert a row below the current row.
				-- move_row_up = "<A-S-k>", -- Move the current row up.
				-- move_row_down = "<A-S-j>", -- Move the current row down.
				-- insert_column_left = "<A-h>", -- Insert a column to the left of current column.
				-- insert_column_right = "<A-l>", -- Insert a column to the right of current column.
				-- move_column_left = "<A-S-h>", -- Move the current column to the left.
				-- move_column_right = "<A-S-l>", -- Move the current column to the right.
				-- insert_table = "<A-t>", -- Insert a new table.
				-- insert_table_alt = "<A-S-t>", -- Insert a new table that is not surrounded by pipes.
				-- delete_column = "<A-d>", -- Delete the column under cursor.
			},
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
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
			},
			heading = {
				sign = true,
				-- Determines how icons fill the available space:
				--  inline:  underlying '#'s are concealed resulting in a left aligned icon
				--  overlay: result is left padded with spaces to hide any additional '#'
				position = "overlay",
				-- Replaces '#+' of 'atx_h._marker'
				-- The number of '#' in the heading determines the 'level'
				-- The 'level' is used to index into the array using a cycle
				icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
				-- Added to the sign column if enabled
				-- The 'level' is used to index into the array using a cycle
				signs = { "󰫎 " },
				-- Width of the heading background:
				--  block: width of the heading text
				--  full:  full width of the window
				-- Can also be an array of the above values in which case the 'level' is used
				-- to index into the array using a clamp
				width = "block",
				-- Amount of padding to add to the left of headings
				left_pad = 0,
				-- Amount of padding to add to the right of headings when width is 'block'
				right_pad = 3,
				-- Minimum width to use for headings when width is 'block'
				min_width = 0,
				-- Determins if a border is added above and below headings
				border = false,
				-- Highlight the start of the border using the foreground highlight
				border_prefix = false,
				-- Used above heading for border
				above = "▄",
				-- Used below heading for border
				below = "▀",
			},
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
