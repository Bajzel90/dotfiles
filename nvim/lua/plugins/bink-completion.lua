return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets", "saghen/blink.compat" },
	version = "*",

	opts = {
		keymap = { preset = "default" },

		completion = {
			menu = {
				border = "rounded",
				winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
			},
			documentation = {
				auto_show = true,
				window = {
					border = "rounded",
				},
			},
			ghost_text = {
				enabled = true,
			},
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				obsidian = {
					name = "obsidian",
					module = "blink.compat.source",
				},
				obsidian_new = {
					name = "obsidian_new",
					module = "blink.compat.source",
				},
				obsidian_tags = {
					name = "obsidian_tags",
					module = "blink.compat.source",
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
