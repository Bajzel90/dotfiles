return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		completion = {
			nvim_cmp = false,
		},
		workspaces = {
			{
				name = "Adam's Notes",
				path = "$HOME/Dropbox/vault/",
			},
		},

		notes_subdir = "00-inbox",
		new_notes_location = "notes_subdir",

		disable_frontmatter = true,

		templates = {
			subdir = "templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M:%S",
		},

		mappings = {
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
		},
		note_id_func = function(title)
			local suffix = ""
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return suffix
		end,

		markdown_link_func = function(opts)
			return string.format("[%s](%s)", opts.label:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower(), opts.path)
		end,

		-- Either 'wiki' or 'markdown'.
		preferred_link_style = "markdown",

		ui = {
			enable = false, -- set to false to disable all additional syntax features
		},
	},

	config = function(_, opts)
		require("obsidian").setup(opts)
		-- HACK: fix error, disable completion.nvim_cmp option, manually register sources
		local cmp = require("cmp")
		cmp.register_source("obsidian", require("cmp_obsidian").new())
		cmp.register_source("obsidian_new", require("cmp_obsidian_new").new())
		cmp.register_source("obsidian_tags", require("cmp_obsidian_tags").new())
	end,
}
