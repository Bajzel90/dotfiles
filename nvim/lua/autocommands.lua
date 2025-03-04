vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Markdown file settings",
	pattern = { "markdown" },
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.wrap = true
		vim.opt_local.colorcolumn = ""
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Json file settings",
	pattern = { "json" },
	callback = function()
		vim.opt_local.wrap = false
		vim.opt_local.spell = false
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
		vim.opt_local.conceallevel = 0
	end,
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*.sql",
-- 	callback = function()
-- 		print("Formatowanie pliku SQL...")
-- 		vim.cmd("%!sqlformat --maxLineWidth 88 --indent '  '")
-- 	end,
-- 	desc = "Automatyczne formatowanie plików SQL przed zapisem",
-- })

-- local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*.go",
-- 	callback = function()
-- 		require("go.format").goimports()
-- 	end,
-- 	group = format_sync_grp,
-- })
