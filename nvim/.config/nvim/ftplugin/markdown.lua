-- Text formatting settings
vim.opt_local.wrap = true -- miękkie zawijanie
vim.opt_local.linebreak = true -- zawijanie po całych słowach
vim.opt_local.breakindent = true

vim.opt_local.textwidth = 88 -- limit kolumn
vim.opt_local.formatoptions = "tcqjn"
vim.opt_local.colorcolumn = "89"

-- t: auto-wrap przy textwidth w Insert
-- c,q: formatowanie komentarzy/tekstu gq/gw
-- j: nie zostawia "osieroconych" komentarzy
-- n: szanuje numerowane listy

-- Keymaps
local map = vim.keymap.set
local opts = { noremap = true, silent = true, buffer = 0 }

-- Nawigacja po zawiniętych liniach
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)

-- search markdown links
map("n", "<Tab>", "<Cmd>call search('\\\\[[^]]*\\\\](([^)]\\\\+))')<CR>", opts)
map("n", "<S-Tab>", "<Cmd>call search('\\\\[[^]]*\\\\](([^)]\\\\+))', 'b')<CR>", opts)
