return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			{
				"mfussenegger/nvim-dap-python",
				lazy = true,
				config = function()
					local python = vim.fn.expand("~/01-projects/api-tool/.venv/bin/python")
					require("dap-python").setup(python)
				end,
				-- Consider the mappings at
				-- https://github.com/mfussenegger/nvim-dap-python?tab=readme-ov-file#mappings
				dependencies = {
					"mfussenegger/nvim-dap",
				},
			},
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")

			require("nvim-dap-virtual-text").setup()

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

			local map = vim.keymap.set

			map("n", "<leader>?", function()
				dapui.eval(nil, { enter = true })
			end)
			-- Nvim DAP
			map("n", "<Leader>dl", dap.step_into, { desc = "Debugger step into" })
			map("n", "<Leader>dj", dap.step_over, { desc = "Debugger step over" })
			map("n", "<Leader>dk", dap.step_out, { desc = "Debugger step out" })
			map("n", "<Leader>dc", dap.continue, { desc = "Debugger continue" })
			map("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Debugger toggle breakpoint" })
			map("n", "<Leader>dr", dap.restart, { desc = "Debugger restart" })
			map("n", "<Leader>dg", dap.run_to_cursor, { desc = "Debugger restart" })

			-- rustaceanvim
			map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

			-- dap.adapters.python = {
			-- 	type = "executable",
			-- 	command = "python",
			-- 	args = { "-m", "debugpy.adapter" },
			-- }
			--
			-- dap.configurations.python = {
			-- 	{
			-- 		type = "python",
			-- 		request = "launch",
			-- 		name = "Api tool debug",
			-- 		program = "${file}",
			-- 		pythonPath = function()
			-- 			return "~/01-projects/api-tool/.venv/bin/python"
			-- 		end,
			-- 		-- env = {
			-- 		-- 	PYTHONPATH = "/path/to/your/project",
			-- 		-- },
			-- 	},
			-- }
		end,
	},
}
