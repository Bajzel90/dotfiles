vim.pack.add({
	{ src = "https://github.com/zongben/dbout.nvim" },
})

require("dbout").setup({
	keymaps = {
		global = {
			toggle_inspector = "<F12>",
			toggle_viewer = "<F11>",
			close = "q",
		},
		queryer = {
			query = "<F5>",
			format = "<F2>",
		},
	},
})
