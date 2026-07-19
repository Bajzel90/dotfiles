hl.config({ general = { layout = "master" } })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({ dwindle = { preserve_split = true } })

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({ master = { new_status = "master", mfact = 0.5 } })

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({ scrolling = { fullscreen_on_one_column = true } })

local utils = require("utils")
local bind = utils.bind

local layouts = { "master", "dwindle", "scrolling", "monocle" }
local layout_index = 1

bind({ "SUPER", "CTRL", "L" }, function()
	local ws = hl.get_active_workspace()
	if not ws then
		return
	end
	layout_index = layout_index % #layouts + 1
	local next_layout = layouts[layout_index]
	hl.workspace_rule({ workspace = tostring(ws.id), layout = next_layout })
	hl.notification.create({ text = "Layout: " .. next_layout, timeout = 2000 })
end)
