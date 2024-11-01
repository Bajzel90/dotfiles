return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap-python",
		"mfussenegger/nvim-dap",
		"leoluz/nvim-dap-go",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dapgo = require("dap-go")
		local dap_python = require("dap-python")
		local dap_virtual_text = require("nvim-dap-virtual-text")

		dapui.setup()
		dap_virtual_text.setup()

		dapgo.setup()
		dap_python.setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
		-- Keymaps
		vim.keymap.set("n", "<leader>dq", function()
			dapui.close()
		end)

		vim.keymap.set("n", "<leader>dc", function()
			dap.continue()
		end)
		vim.keymap.set("n", "<leader>do", function()
			dap.step_over()
		end)
		vim.keymap.set("n", "<leader>di", function()
			dap.step_into()
		end)
		vim.keymap.set("n", "<leader>dO", function()
			dap.step_out()
		end)
		vim.keymap.set("n", "<Leader>db", function()
			dap.toggle_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>dr", function()
			dap.repl.open()
		end)
		vim.keymap.set("n", "<Leader>dl", function()
			dap.run_last()
		end)
		vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
			require("dap.ui.widgets").hover()
		end)
		vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
			require("dap.ui.widgets").preview()
		end)
		vim.keymap.set("n", "<Leader>df", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.frames)
		end)
		vim.keymap.set("n", "<Leader>ds", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.scopes)
		end)
	end,
}
