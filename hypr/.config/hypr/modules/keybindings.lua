local utils = require("utils")
local bind = utils.bind

local terminal = "ghostty"
local file_manager = "nautilus"
local browser = "zen-browser"
local launcher = "walker --provider desktopapplications"
local runner = "walker --provider runner"
local mod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
bind({ mod, "return" }, hl.dsp.exec_cmd(terminal))
bind({ mod, "B" }, hl.dsp.exec_cmd(browser))
bind({ mod, "W" }, hl.dsp.window.close())
bind({ mod, "E" }, hl.dsp.exec_cmd(file_manager))
bind({ mod, "space" }, hl.dsp.exec_cmd(launcher))
bind({ mod, "SHIFT", "space" }, hl.dsp.exec_cmd(runner))
bind({ mod, "SHIFT", "A" }, hl.dsp.exec_cmd(browser .. " --new-window https://claude.ai/new"))

bind(
	{ mod, "SHIFT", "Q" },
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit")
)

bind({ mod, "SHIFT", "ESCAPE" }, hl.dsp.exec_cmd("hyprlock"))

bind({ mod, "SHIFT", "F" }, hl.dsp.window.float({ action = "toggle" }))
bind({ mod, "F" }, hl.dsp.window.fullscreen({ mode = "maximized" }))

-- Move focus with mod + arrow keys
-- On monocle layout, cycle windows instead of directional focus
bind({ mod, "H" }, function()
	local ws = hl.get_active_workspace()
	if ws and ws.tiled_layout == "monocle" then
		hl.dispatch(hl.dsp.layout("cycleprev"))
	else
		hl.dispatch(hl.dsp.focus({ direction = "left" }))
	end
end)
bind({ mod, "J" }, hl.dsp.focus({ direction = "down" }))
bind({ mod, "K" }, hl.dsp.focus({ direction = "up" }))
bind({ mod, "L" }, function()
	local ws = hl.get_active_workspace()
	if ws and ws.tiled_layout == "monocle" then
		hl.dispatch(hl.dsp.layout("cyclenext"))
	else
		hl.dispatch(hl.dsp.focus({ direction = "right" }))
	end
end)

bind({ mod, "SHIFT", "L" }, hl.dsp.window.move({ direction = "right" }))
bind({ mod, "SHIFT", "K" }, hl.dsp.window.move({ direction = "up" }))
bind({ mod, "SHIFT", "J" }, hl.dsp.window.move({ direction = "down" }))
bind({ mod, "SHIFT", "H" }, hl.dsp.window.move({ direction = "left" }))

-- Switch workspaces with mod + [0-9]
-- Move active window to a workspace with mod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	bind({ mod, key }, hl.dsp.focus({ workspace = i }))
	bind({ mod, "SHIFT", key }, hl.dsp.window.move({ workspace = i }))
end

bind({ mod, "TAB" }, hl.dsp.focus({ workspace = "e+1" }))
bind({ mod, "SHIFT", "TAB" }, hl.dsp.workspace.move({ monitor = "+1" }))

-- Move/resize windows with mod + LMB/RMB and dragging
bind({ mod, "mouse:272" }, hl.dsp.window.drag(), { mouse = true })
bind({ mod, "mouse:273" }, hl.dsp.window.resize(), { mouse = true })

-- Resize submap (keyboard resize without mouse)
hl.define_submap("resize", function()
	hl.bind("h", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
	hl.bind("j", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
	hl.bind("k", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
	hl.bind("l", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
	hl.bind("ESCAPE", hl.dsp.submap("reset"))
	hl.bind("return", hl.dsp.submap("reset"))
end)

bind({ mod, "R" }, hl.dsp.submap("resize"))
