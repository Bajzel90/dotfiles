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

local function open_image_from_markdown()
	local ts_utils = require("nvim-treesitter.ts_utils")
	local current_node = ts_utils.get_node_at_cursor()

	-- Traverse up the tree to find the image node

	if current_node:type() == "image_description" then
		current_node = current_node:parent()
	end

	print(current_node:type())

	local fields = current_node:field_names()

	if not fields or #fields == 0 then
		vim.api.nvim_echo({ { "No fields found for the image node", "WarningMsg" } }, false, {})
		return
	end

	-- Print the fields
	for _, field in ipairs(fields) do
		vim.api.nvim_echo({ { field, "Normal" } }, false, {})
	end

	-- -- Extract alt text and URL
	-- local alt_text_node = current_node:field("image_description")[1]
	-- local url_node = current_node:field("link_destination")[1]
	--
	-- print(alt_text_node)
	-- print(url_node)
	--
	-- local alt_text = ts_utils.get_node_text(alt_text_node)[1]
	-- local url = ts_utils.get_node_text(url_node)[1]
	--
	-- -- Display image link in a floating window
	-- vim.api.nvim_echo({ { "Image: " .. alt_text .. " -> " .. url } }, false, {})
end

vim.api.nvim_create_user_command("OpenImage", open_image_from_markdown, {})
