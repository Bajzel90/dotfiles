local opt = vim.opt

opt.autoindent = true
opt.autowrite = true
opt.backup = false
opt.clipboard = "unnamedplus"
opt.colorcolumn = "88"
opt.conceallevel = 2
opt.cursorline = true
opt.ignorecase = true
opt.incsearch = true
opt.linebreak = true
opt.list = false
opt.listchars = { tab = "⇠-⇢", trail = "·", nbsp = "␣", eol = "⇣" }
opt.number = true
opt.relativenumber = true
opt.scrolloff = 0
opt.sidescrolloff = 10
opt.signcolumn = "yes"
opt.smartcase = true
opt.spell = true
opt.spelllang = { "en", "pl" }
opt.splitbelow = true
opt.splitright = true
opt.expandtab = true
opt.sts = 4
opt.sw = 4
opt.tabstop = 4 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 200
opt.undofile = true
opt.updatetime = 250
opt.wrap = true

vim.diagnostic.config({
  float = { border = "rounded" },
})
