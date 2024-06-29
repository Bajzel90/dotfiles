return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      width = 88, -- width of the Zen window
      height = 1, -- height of the Zen window
      -- by default, no options are changed for the Zen window
      -- uncomment any of the options below, or add other vim.wo options you want to apply
      options = {
        signcolumn = "no",      -- disable signcolumn
        number = false,         -- disable number column
        relativenumber = false, -- disable relative numbers
        cursorline = false,     -- disable cursorline
        cursorcolumn = false,   -- disable cursor column
        foldcolumn = "0",       -- disable fold column
        list = false            -- disable whitespace characters
      },
    },
    plugins = {
      alacritty = {
        enabled = true,
        font = "14", -- font size
      },
    }
  }
}
