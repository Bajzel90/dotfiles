return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets", "giuxtaposition/blink-cmp-copilot" },
	version = "*",

	opts = {
		keymap = { preset = "default" },

		completion = {
			documentation = {
				auto_show = true,
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
			-- providers = {
			--   copilot = {
			--     name = "copilot",
			--     module = "blink-cmp-copilot",
			--     -- score_offset = 100,
			--     async = true,
			--   },
			-- },
		},
	},
	opts_extend = { "sources.default" },
}
