return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local telescope = require("telescope")
			local themes = require("telescope.themes")

			telescope.setup({
				extensions = {
					["ui-select"] = {
						themes.get_dropdown({}),
					},
					undo = {
						use_delta = false,
						saved_only = true,
						vim_diff_opts = { result_type = "indices", ctxlen = 9999 },
						layout_config = {
							preview_width = 0.8,
						},
						compare_to_current = true,
					},
				},
			})

			telescope.load_extension("ui-select")
			telescope.load_extension("fzf")

			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Grep Files" })
			vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>.", builtin.oldfiles, { desc = "Find Old Files" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffer" })
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find under cursor" })
			vim.keymap.set("n", "<leader>fc", builtin.git_commits, { desc = "Find Commits" })
			vim.keymap.set("n", "<leader>,", builtin.help_tags, { desc = "Find Help" })
		end,
	},
}
