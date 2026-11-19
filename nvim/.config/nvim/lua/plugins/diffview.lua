vim.pack.add({
	{ src = "https://github.com/sindrets/diffview.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
})

require("diffview").setup({
	enhanced_diff_hl = true,
	view = {
		merge_tool = { layout = "diff3_mixed" },
	},
})

-- Szerszy przegląd zmian (tryb 4). Nie nadpisuje Twoich <leader>gd/gD/gf ze snacks.
vim.keymap.set("n", "<leader>gv", "<cmd>DiffviewOpen<cr>", { desc = "Diffview open" })
vim.keymap.set("n", "<leader>gx", "<cmd>DiffviewClose<cr>", { desc = "Diffview close" })
vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", { desc = "File history (current)" })
vim.keymap.set("n", "<leader>gH", "<cmd>DiffviewFileHistory<cr>", { desc = "File history (all)" })
