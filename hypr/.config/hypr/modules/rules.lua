-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

-- Terminal na workspace 1
hl.window_rule({
	name = "terminal-on-workspace-1",
	match = { class = "com.mitchellh.ghostty" },
	workspace = 1,
})

-- Browser na workspace 2
hl.window_rule({
	name = "browser-on-workspace-2",
	match = { class = "zen" },
	workspace = 2,
})

-- Floating windows — 70% max, centered
local floating_apps = {
	{ class = "org.gnome.Calendar" },
	{ class = "org.gnome.Calculator" },
	{ class = "org.pulseaudio.pavucontrol" },
	{ class = "org.nmrs.ui" },
	{ class = "com.mitchellh.ghostty", title = "^bluetui$" },
	{ class = "com.mitchellh.ghostty", title = "^btop$" },
	{ class = "com.mitchellh.ghostty", title = "^htop$" },
	{ class = "com.mitchellh.ghostty", title = "^jolt$" },
}

for i, match in ipairs(floating_apps) do
	hl.window_rule({
		name = "floating-app-" .. i,
		match = match,
		float = true,
		size = { "(monitor_w*0.7)", "(monitor_h*0.7)" },
		max_size = { "(monitor_w*0.7)", "(monitor_h*0.7)" },
		center = true,
	})
end
