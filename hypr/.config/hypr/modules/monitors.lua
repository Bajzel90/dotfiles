-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
local monitor_external = {
	output = "",
	mode = "preferred",
	position = "auto-center-up",
	scale = 1,
}

local monitor_edp = {
	output = "eDP-1",
	mode = "preferred",
	position = "auto",
	scale = 1.2,
}

hl.monitor(monitor_external)
hl.monitor(monitor_edp)

-- Lid closed:
--   - Jeśli podłączony monitor zewnętrzny → wyłącz ekran laptopa, system dalej działa
--   - Jeśli tylko laptop → uśpij system (systemctl suspend)
hl.bind("switch:on:Lid Switch", function()
	local monitors = hl.get_monitors()
	local has_external = false
	for _, m in ipairs(monitors) do
		if m.name ~= "eDP-1" then
			has_external = true
			break
		end
	end

	if has_external then
		hl.monitor({ output = "eDP-1", disabled = true })
		hl.timer(function()
			hl.exec_cmd("pkill waybar; waybar")
		end, { timeout = 500, type = "oneshot" })
	else
		hl.exec_cmd("systemctl suspend")
	end
end, { locked = true })

-- Lid opened: przeładuj konfigurację żeby przywrócić monitor (disabled = true nie da się cofnąć bez reload)
hl.bind("switch:off:Lid Switch", function()
	hl.timer(function()
		hl.exec_cmd("hyprctl reload && sleep 0.5 && pkill waybar; waybar &")
	end, { timeout = 1000, type = "oneshot" })
end, { locked = true })
