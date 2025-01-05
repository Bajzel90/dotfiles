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

			telescope.load_extension("ui-select")
			telescope.load_extension("fzf")

			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						themes.get_dropdown({}),
					},
				},
			})

			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files({
					search_dirs = { ".", "~/dotfiles/config/nvim/", "~/Dropbox/vault/", "~/projects/" },
				})
			end, { desc = "Find Files in dirs" })

			vim.keymap.set("n", "<leader>fg", function()
				builtin.live_grep({
					search_dirs = { ".", "~/dotfiles/config/nvim/", "~/Dropbox/vault/", "~/projects/" },
				})
			end, { desc = "Grep Files in dirs" })

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
