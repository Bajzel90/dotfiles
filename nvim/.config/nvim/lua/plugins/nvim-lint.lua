vim.pack.add({ "https://github.com/mfussenegger/nvim-lint" })

local lint = require("lint")

lint.linters_by_ft = {
	c = { "cpplint" },
	cpp = { "cpplint" },
	md = { "markdownlint-cli2" },
	sql = { "sqlfluff" },
	bash = { "shellcheck" },
}

local augroup = vim.api.nvim_create_augroup("LintConfig", {})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	group = augroup,
	callback = function()
		lint.try_lint()
	end,
})
