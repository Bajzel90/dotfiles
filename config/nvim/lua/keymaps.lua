vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set("i", "jk", "<esc>")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "G", "Gzz")

vim.keymap.set("n", "<S-h>", "<Cmd>bp<CR>")
vim.keymap.set("n", "<S-l>", "<cmd>bn<CR>")

vim.keymap.set(
	"v",
	"<leader>mt",
	"!pandoc -t markdown-simple_tables<CR>",
	{ silent = true, desc = "Align selected md table" }
)

vim.keymap.set("v", "<leader>mc", "<Cmd>MDTaskToggle<CR>", { desc = "Tasks" })
vim.keymap.set("n", "<leader>mm", "<Cmd>MDToc<CR>", { desc = "Markdown ToC" })

-- diagnostics

vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "GoTo Next Diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "GoTo Prev Diagnostic" })
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- move items

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set("n", "]]", "]]zz")
-- vim.keymap.set("n", "[[", "[[zz")
