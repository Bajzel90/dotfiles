return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},

		lazy = false,
		opts = { ensure_installed = { "markdownlint-cli2", "markdown-toc", "sqlfluff" } },
	},
}
