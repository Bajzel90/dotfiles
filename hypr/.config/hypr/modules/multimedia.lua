local utils = require("utils")
local bind = utils.bind

-- Laptop multimedia keys for volume and LCD brightness
bind(
	{ "XF86AudioRaiseVolume" },
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
bind(
	{ "XF86AudioLowerVolume" },
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
bind(
	{ "XF86AudioMute" },
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
bind(
	{ "XF86AudioMicMute" },
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
bind({ "XF86MonBrightnessUp" }, hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
bind({ "XF86MonBrightnessDown" }, hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
bind({ "XF86AudioNext" }, hl.dsp.exec_cmd("playerctl next"), { locked = true })
bind({ "XF86AudioPause" }, hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
bind({ "XF86AudioPlay" }, hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
bind({ "XF86AudioPrev" }, hl.dsp.exec_cmd("playerctl previous"), { locked = true })
