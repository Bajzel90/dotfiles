-- UnrealEngine.nvim - Native Neovim 0.12 Plugin Configuration
-- Provides integration with Unreal Engine for LSP, building, and editor launching

-- Start Neovim server for UE5 integration (allows UE5 to open files in this instance)
local socket_path = "/tmp/nvim.sock"
if vim.fn.filereadable(socket_path) == 0 then
	vim.fn.serverstart(socket_path)
end

local engine_path = "/home/adam/programy/UnrealEngine"
if vim.fn.isdirectory(engine_path) == 0 then
	return
end

-- Load the plugin
vim.pack.add({
	{ src = "https://github.com/mbwilding/UnrealEngine.nvim", branch = "main" },
})

local opts = {
	auto_generate = true, -- Auto generates LSP info when detected in CWD
	auto_build = false, -- Auto builds on save
	engine_path = engine_path, -- Path to your UnrealEngine source directory
	build_type = "Development", -- Build type: "DebugGame", "Development", or "Shipping"
	with_editor = true, -- Build with editor
	register_icon = true, -- Register Unreal Engine icon for .uproject files
	register_filetypes = true, -- Register .uproject and .uplugin as JSON
	close_on_success = true, -- Close terminal split on successful builds
	environment_variables = nil, -- Environment variables to pass when launching editor (Linux/Mac only)
}
-- Setup the plugin (non-lazy loading)
require("unrealengine").setup(opts)

-- Register keymaps
local commands = require("unrealengine.commands")

vim.keymap.set("n", "<leader>ug", commands.generate_lsp, { desc = "UnrealEngine: Generate LSP" })
vim.keymap.set("n", "<leader>ub", commands.build, { desc = "UnrealEngine: Build" })
vim.keymap.set("n", "<leader>ur", commands.rebuild, { desc = "UnrealEngine: Rebuild" })
vim.keymap.set("n", "<leader>uo", commands.open, { desc = "UnrealEngine: Open Editor" })
vim.keymap.set("n", "<leader>uc", commands.clean, { desc = "UnrealEngine: Clean" })
vim.keymap.set("n", "<leader>ue", function()
	commands.build_engine({ engine_path = engine_path })
end, { desc = "UnrealEngine: Build Engine" })
