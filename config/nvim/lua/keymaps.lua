local map = vim.keymap.set

map("i", "jj", "<esc>")
map("i", "jk", "<esc>")

map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")
map("n", "G", "Gzz")


map(
  "v",
  "<leader>mt",
  "!pandoc -t markdown-simple_tables<CR>",
  { silent = true, desc = "Align selected md table" }
)

map("v", "<leader>mc", "<Cmd>MDTaskToggle<CR>", { desc = "Tasks" })
map("n", "<leader>mm", "<Cmd>MDToc<CR>", { desc = "Markdown ToC" })

-- diagnostics

map("n", "<space>e", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev, { desc = "GoTo Next Diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "GoTo Prev Diagnostic" })
map("n", "<space>q", vim.diagnostic.setloclist)

-- move items

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Buffers

map("n", "<S-h>", "<Cmd>bp<CR>", { desc = "Buffer Previous" })
map("n", "<S-l>", "<cmd>bn<CR>", { desc = "Buffer Next" })
map("n", "<leader>bD", "<cmd>%bd|e#|bd#<cr>", { desc = "Close all but the current buffer" })
map("n", "<leader>bd", "<cmd>Bdelete<cr>", { desc = "Close buffer" })
map("n", "<leader><tab>", "<cmd>b#<cr>", { desc = "Previously openend Buffer" })

-- toggles
map("n",
  "<leader>tn",
  function()
    vim.o.relativenumber = vim.o.relativenumber == false and true or false
  end,
  { desc = "Toggle relative number" }
)
map("n", "<leader>th", function()
  vim.print("Toggling hidden chars", vim.log.levels.INFO, "core.mappings")
  vim.o.list = vim.o.list == false and true or false
end, { desc = "Toggle hidden chars" })
map("n", "<leader>tl", function()
  vim.print("Toggling signcolumn", vim.log.levels.INFO, "core.mappings")
  vim.o.signcolumn = vim.o.signcolumn == "yes" and "no" or "yes"
end, { desc = "Toggle signcolumn" })
map("n", "<leader>tv", function()
  vim.print("Toggling virtualedit", vim.log.levels.INFO, "core.mappings")
  vim.o.virtualedit = vim.o.virtualedit == "all" and "block" or "all"
end, { desc = "Toggle virtualedit" })
map("n", "<leader>ts", function()
  vim.print("Toggling spell", vim.log.levels.INFO, "core.mappings")
  vim.o.spell = vim.o.spell == false and true or false
end, { desc = "Toggle spell" })
map("n", "<leader>tw", function()
  vim.print("Toggling wrap", vim.log.levels.INFO, "core.mappings")
  vim.o.wrap = vim.o.wrap == false and true or false
end, { desc = "Toggle wrap" })
map("n", "<leader>tc", function()
  vim.print("Toggling cursorline", vim.log.levels.INFO, "core.mappings")
  vim.o.cursorline = vim.o.cursorline == false and true or false
end, { desc = "Toggle cursorline" })
map("n", "<leader>tO", "<cmd>lua require('utils.functions').toggle_colorcolumn()<cr>", { desc = "Toggle colorcolumn" })
map(
  "n",
  "<leader>tt",
  "<cmd>lua require('core.plugins.lsp.utils').toggle_virtual_text()<cr>",
  { desc = "Toggle Virtualtext" }
)
map("n", "<leader>tS", "<cmd>windo set scb!<cr>", { desc = "Toggle Scrollbind" })
