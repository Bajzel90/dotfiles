-- return {
--   "mbbill/undotree",
--   keys = {
--     { "<leader>fh", "<cmd>UndotreeToggle<cr>", desc = "File History" },
--   },
-- }
return {
	"jiaoshijie/undotree",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		local undotree = require("undotree")
		undotree.setup({
			float_diff = false,
			layout = "left_bottom", -- "left_bottom", "left_left_bottom"
			position = "left", -- "right", "bottom"
		})
	end,
	keys = { -- load the plugin only when using it's keybinding:
		{ "<leader>fh", "<cmd>lua require('undotree').toggle()<cr>" },
	},
}
