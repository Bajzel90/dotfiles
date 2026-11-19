vim.pack.add({ "https://github.com/esmuellert/codediff.nvim" })

vim.keymap.set("n", "<leader>gc", "<cmd>CodeDiff<cr>", { desc = "CodeDiff (live review)" })
