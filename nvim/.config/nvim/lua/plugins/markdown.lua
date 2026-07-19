vim.pack.add({
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/selimacerbas/live-server.nvim" },
	{ src = "https://github.com/selimacerbas/markdown-preview.nvim", version = "main" },
})

require("render-markdown").setup({
	-- Enable for markdown files
	file_types = { "markdown" },

	code = {
		width = "block",
		right_pad = 1,
		conceal_delimiters = false,
		border = "none",
	},
	heading = {
		sign = false,
		icons = {},
	},
	bullet = { enabled = true, icons = { "", "" } },
	render_modes = { "n", "c", "t" },
	latex = { enabled = false },
})

require("markdown_preview").setup({
	-- all optional; sane defaults shown
	instance_mode = "multi", -- "takeover" (one tab) or "multi" (tab per instance)
	port = 0, -- 0 = auto (8421 for takeover, OS-assigned for multi)
	open_browser = true,
	mermaid_renderer = "rust",
	debounce_ms = 300,
})
