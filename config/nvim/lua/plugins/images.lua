return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1001, -- this plugin needs to run before anything else
		opts = {
			rocks = { "magick" },
		},
	},
	{
		"3rd/image.nvim",
		dependencies = { "luarocks.nvim" },
		config = function()
			local image = require("image")
			image.setup({
				integrations = {
					markdown = {
						enabled = false,
						resolve_image_path = function(document_path, image_path, fallback)
							-- document_path is the path to the file that contains the image
							-- image_path is the potentially relative path to the image. for
							-- markdown it's `![](this text)`

							-- you can call the fallback function to get the default behavior
							return fallback(document_path, image_path)
						end,

						only_render_image_at_cursor = true,
						clear_in_insert_mode = false,
					},
				},
				max_height_window_percentage = 80,
			})

			vim.keymap.set("n", "<leader>ti", function()
				if image.is_visible() then
					image.disable()
				else
					image.enable()
				end
			end, { desc = "Toggle image" })
		end,
	},
}
