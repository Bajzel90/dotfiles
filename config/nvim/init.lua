vim.g.mapleader = " "
vim.g.have_nerd_font = true
vim.g.autoformat = true
vim.gsharpenup_map_prefix = ","

require("options")
require("keymaps")
require("autocommands")
require("commands")

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

require("lazy").setup("plugins")
