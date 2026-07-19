local utils = require("utils")
local bind = utils.bind

local mod = "SUPER"

-- Select area → swappy editor → clipboard as image/png
bind(
	{ mod, "SHIFT", "S" },
	hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | swappy -f - -o - | wl-copy --type image/png")
)

-- Select area → save to ~/Pictures/Screenshots/
bind(
	{ mod, "SHIFT", "CTRL", "S" },
	hl.dsp.exec_cmd(
		"grim -g \"$(slurp)\" ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png"
	)
)

-- Full screen → clipboard
bind(
	{ mod, "CTRL", "S" },
	hl.dsp.exec_cmd("grim - | wl-copy --type image/png")
)
