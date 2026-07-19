vim.pack.add({
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("^1") },
})

require("blink.cmp").setup({
	keymap = {
		preset = "default",
	},

	completion = {
		list = { selection = { preselect = false, auto_insert = true } },
		accept = {
			auto_brackets = {
				enabled = false,
			},
		},

		documentation = {
			auto_show = false,
		},
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	cmdline = {
		enabled = false,
	},
})
