local utils = require("utils")
local bind = utils.bind

local mod = "SUPER"

-- Workaround for send_shortcut leaving synthetic key state stuck/repeating:
-- https://github.com/hyprwm/Hyprland/discussions/14099
local function send_shortcut_once(mods, key)
	return function()
		hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "down", window = "activewindow" }))
		hl.timer(function()
			hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "up", window = "activewindow" }))
		end, { timeout = 50, type = "oneshot" })
	end
end

bind({ mod, "C" }, send_shortcut_once("CTRL", "Insert")) -- copy
bind({ mod, "A" }, send_shortcut_once("CTRL", "A")) --
bind({ mod, "V" }, send_shortcut_once("CTRL SHIFT", "V")) -- paste
bind({ mod, "X" }, send_shortcut_once("CTRL", "X")) -- cut
bind({ mod, "CTRL", "V" }, hl.dsp.exec_cmd("walker --provider clipboard")) -- clipboard history (Walker)
