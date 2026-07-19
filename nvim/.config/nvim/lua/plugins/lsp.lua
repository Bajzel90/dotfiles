vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/p00f/clangd_extensions.nvim" },
})

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"bashls",
		"bacon-ls",
		"clangd",
		"clang-format",
		"cpplint",
		"lua_ls",
		"markdown-toc",
		"markdownlint-cli2",
		"marksman",
		"mmdc",
		"prettier",
		"pyright",
		"qmlls",
		"ruff",
		"rust-analyzer",
		"shellcheck",
		"shfmt",
		"sqlfmt",
		"sqlfluff",
		"stylua",
		"svelte",
		"tectonic",
		"ts_ls",
	},
	auto_update = true,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "MasonToolsStartingInstall",
	callback = function()
		vim.schedule(function()
			print("mason-tool-installer is starting")
		end)
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "MasonToolsUpdateCompleted",
	callback = function(e)
		vim.schedule(function()
			print(vim.inspect(e.data)) -- print the table that lists the programs that were installed
		end)
	end,
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = {
				globals = { "vim", "MiniDeps", "MiniFiles", "Snacks", "require", "dap" },
			},

			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

-- Configure global LSP UI settings (affects all LSP floating windows)
vim.lsp.config("*", {
	ui = {
		float = {
			border = "rounded", -- Consistent with diagnostic floats
			max_width = 60, -- Same as previous signature help setting
			max_height = 30, -- Prevents floats from covering too much screen
		},
	},
})

-- Note: mason-tool-installer automatically enables LSP servers listed in ensure_installed
--
-- Neovim 0.11+ provides default LSP keymaps that can be enabled/disabled:
-- grn - vim.lsp.buf.rename()
-- grr - vim.lsp.buf.references()
-- gri - vim.lsp.buf.implementation()
-- gra - vim.lsp.buf.code_action()
-- gO  - vim.lsp.buf.document_symbol()
-- <C-S> - vim.lsp.buf.signature_help() (insert mode)
--
-- To enable these default keymaps globally:
-- vim.g.lsp_default_keymaps = true
--
-- To disable them globally:
vim.g.lsp_default_keymaps = false
--
-- Current setup: Using custom keymaps defined in lua/config/diagnostics.lua
