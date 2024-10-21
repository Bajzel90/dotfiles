return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependiences = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local on_attach = function(_, bufnr)
			local map = function(keys, func, desc)
				vim.keymap.set(
					"n",
					keys,
					func,
					{ desc = "LSP: " .. desc, noremap = true, silent = true, buffer = bufnr }
				)
			end

			local buildin = require("telescope.builtin")

			map("gr", buildin.lsp_references, "[G]oto [R]eferences")
			map("gd", buildin.lsp_definitions, "[G]oto [D]efinition")
			map("gd", buildin.lsp_definitions, "[G]oto [D]efinition")
			map("gI", buildin.lsp_implementations, "[G]oto [I]mplementation")
			map("<leader>D", buildin.lsp_type_definitions, "Type [D]efinition")
			map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
			map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
			map("K", vim.lsp.buf.hover, "Hover Documentation")
			map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		lspconfig.marksman.setup({ capabilities = capabilities, on_attach = on_attach })

		lspconfig.lua_ls.setup({
			on_init = function(client)
				local path = client.workspace_folders[1].name
				if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
					return
				end

				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
						},
					},
				})
			end,
			settings = {
				Lua = {},
			},
			capabilities = capabilities,
			on_attach = on_attach,
		})

		require("lspconfig").pyright.setup({
			settings = {
				pyright = {
					-- Using Ruff's import organizer
					disableOrganizeImports = true,
				},
				python = {
					analysis = {
						-- Ignore all files for analysis to exclusively use Ruff for linting
						{ diagnosticMode = "off", typeCheckingMode = "off" },
						ignore = { "*" },
					},
				},
			},
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.gopls.setup({ capabilities = capabilities, on_attach = on_attach })

		local util = require("lspconfig.util")

		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetytpes = { "rust" },
			root_dir = util.root_pattern("Cargo.toml"),
			settings = {
				["rust_analyzer"] = {
					cargo = {
						allFeatures = true,
					},
				},
			},
		})

		lspconfig.svelte.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetytpes = { "svelte", "html" },
		})
		lspconfig.ts_ls.setup({
			capabilities = capabilities,
		})
		lspconfig.ruff_lsp.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			init_options = {
				settings = {
					-- Any extra CLI arguments for `ruff` go here.
					args = {},
				},
			},
		})
		lspconfig.bashls.setup({ capabilities = capabilities, on_attach = on_attach })

		lspconfig.denols.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
		})

		lspconfig.omnisharp_mono.setup({
			capabilities = capabilities,
			on_attach = function(_, bufnr)
				-- Enable completion triggered by <c-x><c-o>
				vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
			end,
			enable_import_completion = true,
			organize_imports_on_format = true,
			enable_roslyn_analyzers = true,
			root_dir = function()
				return vim.loop.cwd() -- current working directory
			end,
		})
	end,
}
