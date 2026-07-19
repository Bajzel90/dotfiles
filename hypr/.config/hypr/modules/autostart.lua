-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

local HOME = os.getenv("HOME")

hl.on("hyprland.start", function()
	hl.exec_cmd(HOME .. "/.config/hypr/scripts/check-deps.sh")
	hl.exec_cmd("xembedsniproxy")
	hl.exec_cmd("waybar")
	hl.exec_cmd("mako")
	hl.exec_cmd("hyprpaper")
	-- reset-failed: hyprpolkitagent may hit start-limit on first crash (race at boot),
	-- which would block all subsequent start attempts until reset.
	hl.exec_cmd("systemctl --user reset-failed hyprpolkitagent")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("systemctl --user start jolt.service")
	-- Elephant backend daemon (clipboard + providers for Walker)
	hl.exec_cmd("systemctl --user start elephant.service")
	-- Walker background service for faster startup
	hl.exec_cmd("walker --gapplication-service")
	hl.exec_cmd("hyprctl setcursor rose-pine-dawn-hyprcursor 24")
end)
