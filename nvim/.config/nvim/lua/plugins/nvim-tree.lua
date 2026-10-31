vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- optional
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
})

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local config = {
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
}
require("nvim-tree").setup(config)
