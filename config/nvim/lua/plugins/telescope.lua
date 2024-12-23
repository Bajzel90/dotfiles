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
			vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Find in File (grep)" })
			vim.keymap.set("n", "<leader>.", builtin.oldfiles, { desc = "Find recent open" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffer" })
			vim.keymap.set("n", "<leader>ff", builtin.lsp_document_symbols, { desc = "Find LSP doc symbols" })
			vim.keymap.set("n", "<leader>w", builtin.grep_string, { desc = "Find under cursor" })
		end,
	},
}
