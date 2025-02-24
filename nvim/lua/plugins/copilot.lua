return {
	{
		"zbirenbaum/copilot.lua",
		config = function()
			require("copilot").setup({})
		end,
	},
	{
		{
			"CopilotC-Nvim/CopilotChat.nvim",
			dependencies = {
				{ "zbirenbaum/copilot.vim" },
				{ "nvim-lua/plenary.nvim", branch = "master" },
			},
			build = "make tiktoken", -- Only on MacOS or Linux
			opts = {},
		},
	},
}
