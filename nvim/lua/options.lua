local opt = vim.opt

opt.autoindent = true
opt.autowrite = true
opt.backup = false
opt.clipboard = "unnamedplus"
opt.colorcolumn = "88"
opt.conceallevel = 2
opt.cursorline = true
opt.ignorecase = true
opt.incsearch = true
opt.linebreak = true
opt.list = false
opt.listchars = { tab = ">>", trail = "·", nbsp = "␣" }
opt.number = true
opt.relativenumber = true
opt.scrolloff = 0
opt.sidescrolloff = 10
opt.signcolumn = "yes"
opt.smartcase = true
opt.spell = true
opt.spelllang = { "en", "pl" }
opt.splitbelow = true
opt.splitright = true
opt.expandtab = true
opt.sts = 4
opt.sw = 4
opt.tabstop = 4 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 200
opt.undofile = true
opt.updatetime = 250
opt.wrap = true

vim.diagnostic.config({
	float = { border = "rounded" },
})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "LineNr", { fg = "#909090", bg = "none" })
		vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { fg = "#909090", bg = "none" })
	end,
})

vim.keymap.set("n", "tv", function()
	local new_config = not vim.diagnostic.config().virtual_lines
	vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = "Toggle diagnostic virtual_lines" })
