-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/
require("modules.monitors")
require("modules.envs")
require("modules.autostart")
require("modules.input")
require("modules.keybindings")
require("modules.multimedia")
require("modules.clipboard")
require("modules.screenshot")
require("modules.layout")
require("modules.animations")
require("modules.rules")

hl.config({
	misc = {
		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
	},
	cursor = {
		enable_hyprcursor = true,
	},
})
