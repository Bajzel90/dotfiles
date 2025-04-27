return {
	"TheLeoP/powershell.nvim",
	opts = {
		bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
		shell = "pwsh",
		capabilities = require("blink.cmp").get_lsp_capabilities(),
	},
}
