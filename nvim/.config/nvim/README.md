# Neovim Configuration

Personal Neovim configuration using native `vim.pack` system.

## Features

- Native `vim.pack` plugin management (no lazy.nvim/packer)
- Modular Lua structure
- LSP, formatting, and linting support
- DAP debugging
- Git integration
- Unreal Engine support

## Requirements

- Neovim >= 0.12
- Git
- Nerd Font (optional, for icons)

## Structure

```
~/.config/nvim/
├── init.lua              # Entry point
├── lua/
│   ├── config/          # Core settings (options, keymaps, autocmds)
│   └── plugins/         # Plugin configurations
├── ftplugin/            # Filetype-specific settings
└── nvim-pack-lock.json  # Plugin version lock
```

## Key Plugins

- **LSP**: nvim-lspconfig, mason.nvim, mason-lspconfig.nvim
- **Completion**: blink.cmp with copilot support
- **Syntax**: nvim-treesitter, nvim-treesitter-context
- **Formatting**: conform.nvim
- **Linting**: nvim-lint
- **Git**: gitsigns.nvim, lazygit
- **File Explorer**: oil.nvim
- **Debug**: nvim-dap, nvim-dap-python
- **UI**: snacks.nvim, lualine.nvim, bufferline.nvim
- **Themes**: kanagawa.nvim, thorn.nvim, koda.nvim
- **Markdown**: render-markdown.nvim
- **Other**: mini.nvim, stay-centered.nvim, vim-tmux-navigator

## Language Support

Auto-format and auto-lint on save for:
- Python (ruff, black)
- Lua (stylua)
- JavaScript/TypeScript (prettier)
- C++ (clang-format)
- Markdown, JSON, HTML, CSS, and more
