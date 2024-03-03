local opt = vim.opt

opt.autoindent = true
opt.autowrite = true
opt.clipboard = "unnamedplus"
opt.colorcolumn = "88"
opt.conceallevel = 2
opt.cursorline = true
opt.expandtab = true
opt.linebreak = true
opt.list = false
opt.listchars = { tab = "⇠-⇢", trail = "·", nbsp = "␣", eol = "⇣" }
opt.number = true
opt.relativenumber = true
opt.scrolloff = 10
opt.signcolumn = "yes"
opt.spell = false
opt.spelllang = { "en", "pl" }
opt.splitbelow = true
opt.splitright = true
opt.sts = 2
opt.sw = 2
opt.tabstop = 2          -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 50
opt.undofile = true
opt.updatetime = 250
opt.wrap = true
vim.diagnostic.config({
  float = { border = "rounded" },
})
