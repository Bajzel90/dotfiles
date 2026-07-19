vim.pack.add({
	"https://codeberg.org/mfussenegger/nvim-dap.git",
	"https://github.com/igorlfs/nvim-dap-view",
	"https://github.com/theHamsta/nvim-dap-virtual-text",
	"https://github.com/mfussenegger/nvim-dap-python",
})

-- Configuration after loading
local dap = require("dap")
require("dap-view").setup({
	windows = {
		size = 0.45,
		position = "right",
		terminal = {
			size = 0.3,
			position = "below",
			-- List of debug adapters for which the terminal should be ALWAYS hidden
			hide = {},
		},
	},
})

vim.g.dap_virtual_text_debug = true

require("nvim-dap-virtual-text").setup({
	enabled = true,
	all_frames = true,
	highlight_changed_variables = true,
	highlight_new_as_changed = false,
	show_stop_reason = true,
	commented = false,
	virt_text_pos = "eol",
})

vim.api.nvim_set_hl(0, "NvimDapVirtualText", { fg = "#e2ff29", bg = "#3a506b" })
vim.api.nvim_set_hl(0, "NvimDapVirtualTextError", { fg = "#ff0000", bg = "#3a506b" })

-- Helper function to check if debug session is active
local function is_session_active()
	return dap.session() ~= nil
end

-- conditional keymaps - only work during active debug session
local function map_if_active(key, func, desc)
	vim.keymap.set("n", key, function()
		if is_session_active() then
			func()
		else
			vim.notify("debug session not active", vim.log.levels.WARN)
		end
	end, { desc = desc })
end

-- stylua: ignore start
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "Run/Continue" })
map_if_active("<leader>da", function() dap.continue({ before = get_args }) end, "Run with Args")
map_if_active("<leader>dC", function() dap.run_to_cursor() end, "Run to Cursor")
map_if_active("<leader>dg", function() dap.goto_() end, "Go to Line (No Execute)")
map_if_active("<leader>dl", function() dap.step_into() end, "Step Into")
map_if_active("<leader>dd", function() dap.down() end, "Down")
map_if_active("<leader>du", function() dap.up() end, "Up")
map_if_active("<leader>dh", function() dap.step_out() end, "Step Out")
map_if_active("<leader>dj", function() dap.step_over() end, "Step Over")
map_if_active("<leader>dr", function() dap.repl.toggle() end, "Toggle REPL")
map_if_active("<leader>ds", function() dap.session() end, "Session")
map_if_active("<leader>dt", function() dap.terminate() end, "Terminate")
map_if_active("?", function() require("dap.ui.widgets").hover() end, "Widgets")
-- stylua: ignore end

require("dap-python").setup("uv")
