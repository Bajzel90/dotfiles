local options = {
	signs = {
		add = { text = "│" },
		change = { text = "│" },
		delete = { text = "󰍵" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "│" },
	},

	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function opts(desc)
			return { desc = desc }
		end

		local function map(mode, l, r, ops)
			ops = ops or {}
			ops.buffer = bufnr
			vim.keymap.set(mode, l, r, ops)
		end

		-- Navigation
		map("n", "]h", function()
			if vim.wo.diff then
				return "]h"
			end
			vim.schedule(function()
				gs.next_hunk()
				gs.preview_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[h", function()
			if vim.wo.diff then
				return "[h"
			end
			vim.schedule(function()
				gs.prev_hunk()
				gs.preview_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "<leader>hr", gs.reset_hunk, opts("Reset Hunk"))
		map("n", "<leader>hp", gs.preview_hunk, opts("Preview Hunk"))
		map("n", "<leader>hb", gs.blame_line, opts("Blame Line"))
	end,
}

return {
	{ "tpope/vim-fugitive" },
	{ "lewis6991/gitsigns.nvim", opts = options },
}
