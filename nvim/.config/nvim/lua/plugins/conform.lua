vim.pack.add({ "https://github.com/stevearc/conform.nvim.git" })

local conform = require("conform")

conform.setup({
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
		sqlfluff = {
			args = { "format", "--dialect=ansi", "-" },
		},
	},
	formatters_by_ft = {
		lua = { "stylua" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		python = {
			"ruff_fix", -- To fix lint errors. (ruff with argument --fix)
			"ruff_format", -- To run the formatter. (ruff with argument format)
			"ruff_organize_imports",
		},
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "prettier", stop_after_first = true },
		sh = { "shfmt" },
		markdown = { "prettier", "markdownlint-cli2", "markdown-toc" },
		["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
		sql = { "sqlfmt" },
		svelte = { "prettier" },
		qml = { "qmlformat" },
	},
})

-- Manual format command (with notification feedback)
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
	require("conform").format({ async = true }, function(err, did_edit)
		if not err and did_edit then
			vim.notify("Code formatted", vim.log.levels.INFO, { title = "Conform" })
		end
	end)
end, { desc = "Format buffer" })

-- Manual format for injected languages (code blocks in markdown, etc.)
vim.keymap.set({ "n", "v" }, "<leader>cF", function()
	require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
end, { desc = "Format Injected Langs" })

-- Auto-format on save (silent, no notification)
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
