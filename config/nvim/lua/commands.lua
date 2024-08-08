function MarkdownToDoc()
	local filename = vim.fn.expand("%")
	local docx_filename = string.gsub(filename, "%.md$", ".docx")
	os.execute("pandoc -t latex" .. filename .. " | pandoc -f latex --data-dir=docs/rendering/ -o " .. docx_filename)
end

function MarkdownToPdf()
	local filename = vim.fn.expand("%")
	local output_filename = filename:gsub("%.md$", ".pdf")
	local pandoc_command = string.format(
		'pandoc %s -o %s -V geometry:"top=2cm, bottom=1.5cm, left=2cm, right=2cm" -V mainfont:"ING Me" -V fontsize=10pt --toc --standalone -H ~/dotfiles/.head.tex',
		filename,
		output_filename
	)
	local result = vim.api.nvim_call_function("system", { pandoc_command })
	if result == 0 then
		print("Plik PDF został utworzony: " .. output_filename)
	else
		print("Wystąpił błąd podczas konwersji Markdown na PDF.")
	end
end

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
-- Replace '<leader>f' with your preferred key combination
vim.api.nvim_set_keymap("n", "<leader>fs", ":FormatSql<CR>", { noremap = true, silent = true })

-- Function to format SQL code
local function format_sql()
	-- Get the current visual selection
	local start_line = vim.fn.getpos("'<")[2]
	local end_line = vim.fn.getpos("'>")[2]

	-- Get the selected text
	local selected_text = vim.fn.getline(start_line, end_line)

	-- Check if the first line of the selection is a Markdown SQL code block
	if selected_text[1]:match("^%s*```sql") and selected_text[#selected_text]:match("^%s*```") then
		-- Run the sqlformat command on the lines excluding the delimiters
		vim.cmd(string.format("%d,%d!sqlformat --indent '  '", start_line + 1, end_line - 1))
	else
		print("Selection is not a SQL code block.")
	end
end

-- Create the FormatSql command
vim.api.nvim_create_user_command("FormatSql", format_sql, { range = true })

-- Map the shortcut key
vim.api.nvim_set_keymap("v", "<leader>fs", ":FormatSql<CR>", { noremap = true, silent = true })
vim.cmd("command! MarkdownToDoc lua MarkdownToDoc()")
vim.cmd("command! MarkdownToPdf lua MarkdownToPdf()")
