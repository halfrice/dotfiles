local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Colors
config.color_scheme = "Tokyo Night"

-- Fonts
config.font_size = 16
config.font = wezterm.font_with_fallback({
	{ family = "UbuntuMono Nerd Font", scale = 1 },
})
config.adjust_window_size_when_changing_font_size = false

-- Tabs
config.enable_tab_bar = false

-- Windows
config.window_background_opacity = 0.80
config.macos_window_background_blur = 24
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
