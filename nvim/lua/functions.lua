vim.api.nvim_create_user_command("FormatSql", function()
	-- Check if the current buffer is a SQL file
	if vim.bo.filetype == "sql" then
		-- Run the sqlformat command
		vim.cmd("!sqlformat --indent '  '")
	else
		-- Print a message if the file is not a SQL file
		print("This command can only be run on SQL files.")
	end
end, {})

-- Set a shortcut for the FormatSql command
vim.api.nvim_set_keymap(
	"n",
	"<leader>fs",
	":FormatSql<CR>",
	{ noremap = true, silent = true, desc = "Format SQL query" }
)

-- Function to format SQL code
local function format_selected_sql()
	local start_line = vim.fn.getpos("'<")[2]
	local end_line = vim.fn.getpos("'>")[2]

	vim.cmd(string.format("%d,%d!sqlformat --indent '  '", start_line, end_line))
end

-- Create the FormatSql command
vim.api.nvim_create_user_command("FormatSelectedSql", format_selected_sql, { range = true })

-- Map the shortcut key
vim.api.nvim_set_keymap("v", "<leader>fs", ":FormatSelectedSql<CR>", { noremap = true, silent = true })
