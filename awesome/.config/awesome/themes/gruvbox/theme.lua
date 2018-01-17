-------------------------------
--  "Gruvbox" awesome theme  --
--          By pppp.         --
--  Source theme is: zenburn --
-------------------------------

local theme_path = require("gears.filesystem").get_configuration_dir() .. "themes/gruvbox"
local dpi = require("beautiful.xresources").apply_dpi
local naughty = require('naughty')

-- {{{ Main
local theme = {}
theme.wallpaper = theme_path .. "/gruvbox-background.jpg"
-- }}}

-- {{{ Styles
theme.font       = "hack " .. dpi(5)

-- {{{ Colors
theme.fg_normal  = "#bdae93"
theme.fg_focus   = "#b8bb26"
theme.fg_urgent  = "#fb4934"
theme.bg_normal  = "#282828"
theme.bg_focus   = "#1E2320"
theme.bg_urgent  = "#cc241d"
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.useless_gap   = dpi(10)
theme.border_width  = dpi(3)
theme.border_normal = "#3c3936"
theme.border_focus  = "#fb4834"
theme.border_marked = "#292d2e"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#3f3f3f"
theme.titlebar_bg_normal = "#3f3f3f"
-- }}}


-- {{{ Systray
theme.systray_icon_spacing = dpi(10)
-- }}}


-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#fb4934"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height    = dpi(15)
theme.menu_width     = dpi(100)
-- }}}

-- {{{ Notifications
theme.notification_width                     = dpi(250)
theme.notification_font                      = "hack italic " .. dpi(6)
theme.notification_fg                        = "#3c3836"
theme.notification_bg                        = "#bdae93"

-- Unfortunately, I couldn't find the way to override these 2 settings via
-- beautiful variable.
naughty.config.presets.normal.border_width   = dpi(10)
naughty.config.presets.normal.border_color   = "#bdae93"
naughty.config.presets.normal.margin         = dpi(5)
naughty.config.presets.normal.icon_size      = dpi(64)
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = theme_path .. "/taglist/squarefz.png"
theme.taglist_squares_unsel = theme_path .. "/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Tasklist
theme.tasklist_disable_icon = true
-- }}}

-- {{{ Layout
theme.layout_tile       = theme_path .. "/layouts/tile.png"
theme.layout_tileleft   = theme_path .. "/layouts/tileleft.png"
theme.layout_tilebottom = theme_path .. "/layouts/tilebottom.png"
theme.layout_tiletop    = theme_path .. "/layouts/tiletop.png"
theme.layout_fairv      = theme_path .. "/layouts/fairv.png"
theme.layout_fairh      = theme_path .. "/layouts/fairh.png"
theme.layout_spiral     = theme_path .. "/layouts/spiral.png"
theme.layout_dwindle    = theme_path .. "/layouts/dwindle.png"
theme.layout_max        = theme_path .. "/layouts/max.png"
theme.layout_fullscreen = theme_path .. "/layouts/fullscreen.png"
theme.layout_magnifier  = theme_path .. "/layouts/magnifier.png"
theme.layout_floating   = theme_path .. "/layouts/floating.png"
theme.layout_cornernw   = theme_path .. "/layouts/cornernw.png"
theme.layout_cornerne   = theme_path .. "/layouts/cornerne.png"
theme.layout_cornersw   = theme_path .. "/layouts/cornersw.png"
theme.layout_cornerse   = theme_path .. "/layouts/cornerse.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = theme_path .. "/titlebar/close_focus.png"
theme.titlebar_close_button_normal = theme_path .. "/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = theme_path .. "/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = theme_path .. "/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = theme_path .. "/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = theme_path .. "/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = theme_path .. "/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = theme_path .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = theme_path .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = theme_path .. "/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = theme_path .. "/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = theme_path .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = theme_path .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = theme_path .. "/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = theme_path .. "/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = theme_path .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme_path .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme_path .. "/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
