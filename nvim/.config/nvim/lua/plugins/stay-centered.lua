vim.pack.add(
  {"https://github.com/arnamak/stay-centered.nvim"}
)

require('stay-centered').setup({
  skip_filetypes = {},
  enabled = true,
  allow_scroll_move = true,
  disable_on_mouse = true,
})
