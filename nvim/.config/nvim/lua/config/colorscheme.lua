-- theme & transparency
vim.pack.add({
	"https://github.com/rebelot/kanagawa.nvim",
	"https://github.com/jpwol/thorn.nvim",
	"https://github.com/oskarnurm/koda.nvim",
	"https://github.com/p00f/alabaster.nvim",
})

require("koda").setup({
	transparent = true,
	styles = {
		functions = { bold = false },
		keywords = {},
		comments = {},
		strings = {},
		constants = { bold = true }, -- includes numbers, booleans
	},
	colors = {
		bg = "#101010",
		fg = "#dfdfdf",
		dim = "#50585d",
		line = "#272727",
		keyword = "#ffffff",
		comment = "#dbb213",
		border = "#50585d",
		emphasis = "#ff7f11",
		func = "#8ebeec",
		string = "#86cd82",
		const = "#d9ba73",
		highlight = "#0058d0",
		info = "#8ebeec",
		success = "#86cd82",
		warning = "#d9ba73",
		danger = "#ff7676",
	},
})

require("kanagawa").setup({
	compile = false, -- enable compiling the colorscheme
	undercurl = true, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = true, -- do not set background color
	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	colors = { -- add/modify theme and palette colors
		palette = {},
		theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
	},
	overrides = function(colors) -- add/modify highlights
		return {}
	end,
	plugins = { markdown = true },
	theme = "dragon", -- Load "wave" theme
	background = { -- map the value of 'background' option to a theme
		dark = "dragon", -- try "dragon" !
		light = "lotus",
	},
})

vim.cmd.colorscheme("kanagawa")
