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

vim.cmd("command! MarkdownToDoc lua MarkdownToDoc()")
vim.cmd("command! MarkdownToPdf lua MarkdownToPdf()")
