return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    default = {
      file_name = "%Y%m%d-%H%M%S", ---@type string
      dir_path = "img/",
      relative_to_current_file = true,
      show_dir_path_in_prompt = true,
    },
    filetypes = {
      markdown = {
        url_encode_path = true, ---@type boolean
        template = "![$FILE_NAME_NO_EXT]($FILE_PATH)", ---@type string
        download_images = false, ---@type boolean
      },
    }, -- or leave it empty to use the default settings
  },
  keys = {
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
