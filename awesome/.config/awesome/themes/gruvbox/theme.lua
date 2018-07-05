-------------------------------
--  "Gruvbox" awesome theme  --
--          By pppp.         --
--  Source theme is: zenburn --
-------------------------------

local theme_path = require("gears.filesystem").get_configuration_dir() .. "themes/gruvbox"
local dpi = require("beautiful.xresources").apply_dpi
local naughty = require('naughty')

local palette = {
    red = {
        dark  = "#cc241d",
        light = "#fb4934",
    },
    green = {
        dark  = "#98971a",
        light = "#b8bb26",
    },
    yellow = {
        dark  = "#d79921",
        light = "#fabd2f",
    },
    blue = {
        dark  = "#458588",
        light = "#83a598",
    },
    purple = {
        dark  = "#b16286",
        light = "#d3869b",
    },
    aqua = {
        dark  = "#689d6a",
        light = "#8ec07c",
    },
    orange = {
        dark  = "#d65d0e",
        light = "#fe8019",
    },
    gray = {
        dark  = "#928374",
        light = "#a89984",
    },
    black = {
        bg0_h = "#1d2021",
        bg0   = "#282828",
        bg0_s = "#32302f",
        bg1   = "#3c3836",
        bg2   = "#504945",
        bg3   = "#665c54",
        bg4   = "#7c6f64",
    },
    white = {
        fg0   = "#fbf1c7",
        fg1   = "#ebdbb2",
        fg2   = "#d5c4a1",
        fg3   = "#bdae93",
        fg4   = "#a89984",
    },
    transparent = "#ffffff00"
}

local colors = {
    accent = palette.green.light,
    background = palette.black.bg0,
    text = palette.white.fg4,
    inactive_text = palette.black.bg2,
    urgent = palette.red.light,
    transparent = palette.transparent,
}

local font = "hack"
local font_size = 8

-- {{{ Main
local theme = {}
-- For solid color wallpaper
-- theme.wallpaper = gears.color(colors.background)

theme.wallpaper = theme_path .. '/bg.jpg'
-- }}}

-- {{{ Styles
theme.font       = font .. " " .. (font_size + dpi(0.2))

-- {{{ Colors
theme.fg_normal  = colors.text
theme.fg_focus   = colors.accent
theme.fg_urgent  = colors.urgent
theme.bg_normal  = colors.background
theme.bg_focus   = colors.background
theme.bg_urgent  = colors.background
-- }}}

-- {{{ Borders
theme.useless_gap   = dpi(20)
theme.border_width  = dpi(0)
theme.border_normal = "#504945"
theme.border_focus  = "#a89984"
theme.border_marked = "#292d2e"
theme.border_radius = dpi(6)
-- }}}

-- {{{ Titlebars
theme.titlebar_font      = font .. " bold italic "  .. (font_size + dpi(0.2))
theme.titlebar_fg_focus  = "#7c6f64"
theme.titlebar_bg_focus  = "#282828"
theme.titlebar_fg_normal = "#504945"
theme.titlebar_bg_normal = "#282828"
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
theme.notification_width    = dpi(250)
theme.notification_font     = font .. " italic " .. (font_size + 1 + dpi(0.2))
theme.notification_margin   = dpi(2)
theme.notification_fg       = "#3c3836"
theme.notification_bg       = "#bdae93"

-- Unfortunately, I couldn't find the way to override these 2 settings via
-- beautiful variable.
naughty.config.presets.normal.border_width   = dpi(10)
naughty.config.presets.normal.border_color   = "#bdae93"
naughty.config.presets.normal.margin         = dpi(5)
naughty.config.presets.normal.icon_size      = dpi(64)
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_fg_focus = colors.accent
theme.taglist_bg_focus = colors.background
theme.taglist_fg_occupied = colors.text
theme.taglist_fg_empty = colors.inactive_text
theme.taglist_bg_normal = colors.background
theme.taglist_spacing = dpi(10)
-- }}}

-- {{{ Tasklist
theme.tasklist_bg_focus = colors.background
theme.tasklist_font = font .. " italic "  .. (font_size + dpi(0.2))
theme.tasklist_font_focus = font .. " bold italic "  .. (font_size + dpi(0.2))
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

theme.wibar_bg = colors.transparent
theme.wibar_height = 60
theme.wibar_items_bg = colors.background

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
