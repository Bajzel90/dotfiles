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

vim.api.nvim_create_user_command("MarkdownToDoc", MarkdownToDoc, {})
