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
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true

		vim.o.textwidth = 88
		vim.o.formatoptions = vim.o.formatoptions .. "t"
		vim.wo.linebreak = true
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
