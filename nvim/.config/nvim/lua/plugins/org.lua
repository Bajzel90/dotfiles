vim.pack.add({ "https://github.com/xheisenbugx/org.nvim" })

require("org").setup({
	org_directory = "~/org",
	agenda_files = { "~/org/**/*.org" },
	default_notes_file = "~/org/refile.org",
})
