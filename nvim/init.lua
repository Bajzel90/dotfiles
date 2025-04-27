vim.g.mapleader = " "
vim.g.have_nerd_font = true
vim.g.autoformat = true
vim.gsharpenup_map_prefix = ","

require("options")
require("keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "plugins" }, { import = "plugins.lsp" } })
require("autocommands")
require("functions")
require("workflows")

vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.enable("lua_ls")
