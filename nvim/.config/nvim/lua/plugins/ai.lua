vim.pack.add({
	{ src = "https://github.com/CopilotC-Nvim/CopilotChat.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
})

require("CopilotChat").setup()
