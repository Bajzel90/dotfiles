return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependiences = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")

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
			map("gI", buildin.lsp_implementations, "[G]oto [I]mplementation")
			map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
			map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
			map("K", vim.lsp.buf.hover, "Hover Documentation")
			map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		end

		local capabilities = require("blink.cmp").get_lsp_capabilities()

		lspconfig.marksman.setup({ capabilities = capabilities })

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

		lspconfig.azure_pipelines_ls.setup({
			capabilities = capabilities,
			-- settings = {
			-- 	yaml = {
			-- 		schemas = {
			-- 			["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
			-- 				"/azure-pipeline*.y*l",
			-- 				"/*.azure*",
			-- 				"Azure-Pipelines/**/*.y*l",
			-- 				"Pipelines/*.y*l",
			-- 			},
			-- 		},
			-- 	},
			-- },
		})

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
		lspconfig.ruff.setup({
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

		lspconfig.csharp_ls.setup({
			handlers = { ["textDocument/publishDiagnostics"] = function(...) end },
			capabilities = capabilities,
		})
		lspconfig.jdtls.setup({
			capabilities = capabilities,
		})
	end,
}
