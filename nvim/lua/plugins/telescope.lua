return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		branch = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "debugloop/telescope-undo.nvim", branch = "feat/compare_to_current" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
		config = function()
			local telescope = require("telescope")
			local themes = require("telescope.themes")

			telescope.setup({
				-- defaults = {
				-- 	layout_config = {
				-- 		preview_width = 0.6,
				-- 	},
				-- },
				extensions = {
					["ui-select"] = {
						themes.get_dropdown({}),
					},
				},
			})

			telescope.load_extension("ui-select")
			telescope.load_extension("fzf")

			-- local builtin = require("telescope.builtin")

			-- vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
			-- vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Grep Files" })
			-- vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find Files" })
			-- vim.keymap.set("n", "<leader>.", builtin.oldfiles, { desc = "Find Old Files" })
			-- vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffer" })
			-- vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find under cursor" })
			-- vim.keymap.set("n", "<leader>fc", builtin.git_commits, { desc = "Find Commits" })
			-- vim.keymap.set("n", "<leader>,", builtin.help_tags, { desc = "Find Help" })
		end,
	},
}
