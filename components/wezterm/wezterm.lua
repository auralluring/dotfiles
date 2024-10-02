local wezterm = require 'wezterm'
local config = {}

config.colors = require 'colors'

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.automatically_reload_config = true
config.hide_mouse_cursor_when_typing = false
config.enable_wayland = true

return config
