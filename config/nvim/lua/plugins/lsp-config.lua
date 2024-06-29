local lsp_servers = function()
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
      properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
      },
    },
  }
  local lspconfig = require("lspconfig")

  lspconfig.marksman.setup({ capabilities = capabilities })

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
    { capabilities = capabilities },
  })

  lspconfig.pyright.setup({
    -- { capabilities = capabilities },
    init_options = {
      settings = {
        python = {
          analysis = { diagnosticMode = "off", typeCheckingMode = "off" },
        },
      },
    },
  })

  lspconfig.gopls.setup({ capabilities = capabilities })

  local util = require("lspconfig.util")

  lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
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

  -- local pid = vim.fn.getpid()
  -- local omnisharp_bin = "mono /Users/pu54xk/.local/share/omnisharp-mono/OmniSharp.exe"

  -- lspconfig.omnisharp.setup({
  -- 	capabilities = capabilities,
  -- 	cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
  -- 	filetypes = { "cs", "vb" },
  -- 	root_dir = util.root_pattern("*.sln", "*.csproj", "omnisharp.json", "function.json"),
  -- })

  -- local util = require("lspconfig.util")
  -- lspconfig.omnisharp_mono.setup({
  -- 	filetytpes = { "cs", "vb" },
  -- 	root_dir = util.root_pattern("*.sln", "*.csproj", "omnisharp.json", "function.json"),
  -- })

  --------------------------------------------------
  --------------------------------------------------

  lspconfig.svelte.setup({
    capabilities = capabilities,
    filetytpes = { "svelte", "html" },
  })
  lspconfig.tsserver.setup({
    capabilities = capabilities,
  })
  lspconfig.ruff_lsp.setup({
    capabilities = capabilities,
    init_options = {
      settings = {
        -- Any extra CLI arguments for `ruff` go here.
        args = {},
      },
    },
  })
end

local lsp_mapping = function()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
      -- for LSP related items. It sets the mode, buffer and description for us each time.
      local map = function(keys, func, desc)
        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
      end

      local telescope_builtin = require("telescope.builtin")
      map("gd", telescope_builtin.lsp_definitions, "[G]oto [D]efinition")
      map("gr", telescope_builtin.lsp_references, "[G]oto [R]eferences")
      map("gI", telescope_builtin.lsp_implementations, "[G]oto [I]mplementation")
      map("<leader>D", telescope_builtin.lsp_type_definitions, "Type [D]efinition")
      map("<leadmr>rn", vim.lsp.buf.rename, "[R]e[n]ame")
      map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
      map("K", vim.lsp.buf.hover, "Hover Documentation")
      map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if client and client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          buffer = event.buf,
          callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
          buffer = event.buf,
          callback = vim.lsp.buf.clear_references,
        })
      end
    end,
  })
end

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        "lua_ls",
        "pyright",
        "marksman",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      lsp_servers()
      lsp_mapping()
    end,
  },
}
