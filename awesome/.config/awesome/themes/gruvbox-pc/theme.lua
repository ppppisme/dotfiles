local base_theme = "gruvbox"
local theme_path = require("gears.filesystem").get_configuration_dir() .. "themes/" .. base_theme

local dpi = require("beautiful.xresources").apply_dpi
local naughty = require('naughty')

local font = "ttyp0"
local font_size = 14

local theme = require("themes.gruvbox.theme")

theme.wallpaper = theme_path .. '/wallpapers/06.jpg'
theme.font = font .. " " .. (font_size + dpi(0.2))

theme.border_width = dpi(5)

theme.notification_font = font .. " " .. font_size
theme.notification_width = 300
theme.notification_margin = dpi(4)

naughty.config.presets.normal.margin = dpi(20)

return theme
