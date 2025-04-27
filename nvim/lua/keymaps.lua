local map = vim.keymap.set

map("i", "jj", "<esc>")
map("i", "jk", "<esc>")

map("n", "<Esc>", "<cmd>nohlsearch<CR>")

map("n", "<leader>mm", "<Cmd>MDToc<CR>", { desc = "Markdown ToC" })

-- diagnostics
map("n", "<space>e", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev, { desc = "GoTo Next Diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "GoTo Prev Diagnostic" })
map("n", "<space>q", vim.diagnostic.setloclist)

-- move items
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })

map("n", "j", "gj")
map("n", "k", "gk")

-- Buffers
map("n", "<S-h>", "<Cmd>bp<CR>", { desc = "Buffer Previous" })
map("n", "<S-l>", "<cmd>bn<CR>", { desc = "Buffer Next" })

-- toggles
map("n", "<leader>tn", function()
	vim.o.relativenumber = vim.o.relativenumber == false and true or false
end, { desc = "Toggle relative number" })
map("n", "<leader>th", function()
	vim.print("Toggling hidden chars")
	vim.o.list = vim.o.list == false and true or false
end, { desc = "Toggle hidden chars" })
map("n", "<leader>tl", function()
	vim.print("Toggling signcolumn")
	vim.o.signcolumn = vim.o.signcolumn == "yes" and "no" or "yes"
end, { desc = "Toggle signcolumn" })
map("n", "<leader>ti", function()
	vim.print("Toggling inline hints")
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inline hints" })
map("n", "<leader>ts", function()
	vim.print("Toggling spell")
	vim.o.spell = vim.o.spell == false and true or false
end, { desc = "Toggle spell" })
map("n", "<leader>tw", function()
	vim.print("Toggling wrap")
	vim.o.wrap = vim.o.wrap == false and true or false
end, { desc = "Toggle wrap" })
map("n", "<leader>tc", function()
	vim.print("Toggling cursorline")
	vim.o.cursorline = vim.o.cursorline == false and true or false
end, { desc = "Toggle cursorline" })
map("n", "<leader>tm", function()
	require("render-markdown").toggle()
end, { desc = "Toggle markdown preview" })
