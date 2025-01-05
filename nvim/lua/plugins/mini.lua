return {
  {
    "echasnovski/mini.nvim",
    version = false,
    enabled = true,
    config = function()
      require("mini.statusline").setup({ use_icons = true })

      require("mini.indentscope").setup({
        symbol = "│",
        options = { try_as_border = true },
      })
      require("mini.trailspace").setup()
      require("mini.surround").setup()
    end,
  },
}
