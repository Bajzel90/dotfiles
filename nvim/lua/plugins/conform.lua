return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			desc = "Code Format",
		},
	},

	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = {
				"ruff_fix",
				"ruff_format",
				"ruff_organize_imports",
			},
			["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
			["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
			rust = { "rustfmt" },
			cs = { "csharpier" },
			typescript = { "prettier" },
			json = { "prettier" },
			xml = { "xmlformatter" },
			sh = { "shfmt" },
			sql = { "sqlfmt" },
		},

		formatters = {
			["markdown-toc"] = {
				condition = function(_, ctx)
					for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
						if line:find("<!%-%- toc %-%->") then
							return true
						end
					end
				end,
			},
			["markdownlint-cli2"] = {
				condition = function(_, ctx)
					local diag = vim.tbl_filter(function(d)
						return d.source == "markdownlint"
					end, vim.diagnostic.get(ctx.buf))
					return #diag > 0
				end,
			},
		},

		format_on_save = { timeout_ms = 500, lsp_fallback = true },
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		-- vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
