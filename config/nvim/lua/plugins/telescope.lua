return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find Files" })
      vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Find inFile (grep)" })
      vim.keymap.set("n", "<leader>.", builtin.oldfiles, { desc = "Find recent open" })
      vim.keymap.set("n", "<leader>bf", builtin.buffers, { desc = "Find Buffer" })
      require("telescope").load_extension("ui-select")
    end,
  },
}
