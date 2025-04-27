return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		image = {
			enabled = true,
			doc = {
				enabled = true,
				inline = vim.g.neovim_mode == "skitty" and true or false,
				float = true,
				-- max_width = vim.g.neovim_mode == "skitty" and 5 or 60,
				-- max_height = vim.g.neovim_mode == "skitty" and 2.5 or 30,
				max_width = 120,
				max_height = 40,
			},
		},
		styles = {
			snacks_image = {
				relative = "editor",
				col = -1,
			},
			zen = {
				minimal = true,
				width = 100,
			},
		},
		bufdelete = { enabled = true },
		git = { enabled = true },
		indent = { enabled = true },
		lazygit = { enabled = true },
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		input = { enabled = true },
		quickfile = { enabled = true },
		words = { enabled = true },
		terminal = { enabled = true },
		picker = {
			enabled = true,
			opts = {
				{
					preset = "ivy",
					layout = { position = "bottom" },
				},
			},
		},
		zen = { enabled = true },
	},

-- stylua: ignore
	keys = {
		{ "<leader>gg", function() Snacks.lazygit.open() end, desc = "Lazygit" },
		{ "<leader>D", function() Snacks.dashboard.open() end, desc = "Open Dashboard" },
		{ "<leader>tt", function() Snacks.terminal() end, desc = "Toggle terminal" },

        -- Top Pickers & Explorer
        { "<leader><space>", function() Snacks.picker.files() end, desc = "Smart Find Files" },
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>.", function() Snacks.picker.recent() end, desc = "Recent" },
        { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },

        -- find
        { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
        { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
        { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },

        -- git
        { "<leader>gB", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
        { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame" },
        { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
        { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
        { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
        { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },

        -- search
        { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
        { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
        { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
        { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
        { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
        { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
        { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
        { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
        { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
        { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },


        -- Buffer
        { "<leader>bD", function() Snacks.bufdelete.other() end, desc = "Buff Delete others" },
        { "<leader>bd", function() Snacks.bufdelete.delete() end, desc = "Buff Delete " },
        { "<leader>ba", function() Snacks.bufdelete.all() end, desc = "Buff Delete ALL " },

        -- LSP
        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
        { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
        { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
        { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
        { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
        { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

        { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
  },
}
