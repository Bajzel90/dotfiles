vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
})

local ts_parsers = {
	"bash",
	"c",
	"cmake",
	"cpp",
	"css",
	"diff",
	"dockerfile",
	"fish",
	"gitignore",
	"go",
	"gomod",
	"gosum",
	"html",
	"javascript",
	"json",
	"latex",
	"lua",
	"make",
	"markdown",
	"markdown_inline",
	"ninja",
	"python",
	"regex",
	"rst",
	"rust",
	"ron",
	"scss",
	"sql",
	"svelte",
	"toml",
	"tsx",
	"typescript",
	"typst",
	"vim",
	"vue",
	"yaml",
}

local ts = require("nvim-treesitter")

ts.setup({
	ensure_installed = ts_parsers,
	sync_install = true,
	highlight = { enable = true },
	indent = { enable = true },
	incremental_selection = { enable = true },
})

ts.install(ts_parsers):wait(30000)

-- Auto-start treesitter highlighting for all installed parsers
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("TreesitterConfig", {}),
	pattern = ts_parsers,
	callback = function()
		vim.treesitter.start()
	end,
	desc = "Start treesitter highlighting",
})
