-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

local HOME = os.getenv("HOME")

hl.on("hyprland.start", function()
	hl.exec_cmd(HOME .. "/.config/hypr/scripts/check-deps.sh")
	hl.exec_cmd("xembedsniproxy")
	hl.exec_cmd("noctalia --daemon")
	-- reset-failed: hyprpolkitagent may hit start-limit on first crash (race at boot),
	-- which would block all subsequent start attempts until reset.
	hl.exec_cmd("systemctl --user reset-failed hyprpolkitagent")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("systemctl --user start jolt.service")
	hl.exec_cmd("hyprctl setcursor rose-pine-dawn-hyprcursor 24")
end)
