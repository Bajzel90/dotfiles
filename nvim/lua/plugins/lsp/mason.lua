return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		lazy = false,
		opts = { ensure_installed = { "markdownlint-cli2", "markdown-toc", "sqlfluff" } },
		-- config = function()
		-- 	local mason = require("mason")
		-- 	local mason_lspconfig = require("mason-lspconfig")
		--
		-- 	mason.setup()
		-- 	mason_lspconfig.setup({
		-- 		ensure_installed = { "markdownlint-cli2", "markdown-toc" },
		-- 		-- automatic_installation = true,
		-- 	})
		-- end,
	},
}
