local wezterm = require 'wezterm'
local config = {}

config.colors = require 'colors'

config.use_fancy_tab_bar = false
config.automatically_reload_config = true
config.hide_mouse_cursor_when_typing = false
config.enable_wayland = true

return config
