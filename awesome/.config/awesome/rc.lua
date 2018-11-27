local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")

local config_dir = gears.filesystem.get_configuration_dir()

local modkey = "Mod4"
local terminal = os.getenv("TERMINAL") or "xterm"
local theme = "gruvbox"

-- Custom libraries
local librarian = require("librarian")
librarian.init({
    verbose = true,
    libraries_dir = "libraries/",
  })

librarian.require_async("ppppisme/fuzzy", {
    do_after = function(fuzzy)
      fuzzy.init {}

      local source = require("fuzzy.source.path")
      local source2 = require("fuzzy.source.lutris")
      local launcher = require("fuzzy.launcher.run")
      local launcher2 = require("fuzzy.launcher.lutris")
      launcher.init { terminal = terminal }

      root.keys(gears.table.join( -- luacheck: globals root
          root.keys(),  -- luacheck: globals root
          awful.key({ modkey }, "d", function () fuzzy.show({ source = source, launcher = launcher }) end,
            {description = "toggle fuzzy window", group = "app"}),
          awful.key({ modkey }, "s", function () fuzzy.show({ source = source2, launcher = launcher2 }) end,
            {description = "toggle fuzzy window", group = "app"})
          )
        )
    end
  })

-- Add a tittlebar only to floating clients.
librarian.require_async("vladgor/awesome-floatbar", {
    do_after = function(floatbar)
      floatbar.init()
    end,
  })
local tagged = librarian.require("vladgor/awesome-tagged")

-- Init i3wm-like tags navigation.
if (librarian.is_installed("vladgor/awesome-tagged")) then
  local mytags = {
    { -- 1 screen configuration
      {
        { name = "0", layout = awful.layout.suit.tile, keybinding = "0", },
        { name = "1", layout = awful.layout.suit.tile, keybinding = "1", },
        { name = "2", layout = awful.layout.suit.tile, keybinding = "2", },
        { name = "3", layout = awful.layout.suit.tile, keybinding = "3", },
        { name = "4", layout = awful.layout.suit.floating, keybinding = "4",
          clients = {
            class = { "Gimp" }
          }
        },
        { name = "5", layout = awful.layout.suit.tile, keybinding = "5", },
        { name = "6", layout = awful.layout.suit.floating, keybinding = "6",
          clients = {
            class = { "steam.exe", "Wine", "Lutris", "Steam" },
            name = { "Steam" },
          },
        },
        { name = "7", layout = awful.layout.suit.tile, keybinding = "7", },
        { name = "8", layout = awful.layout.suit.tile, keybinding = "8", },
        { name = "9", layout = awful.layout.suit.max, keybinding = "9",
          clients = {
            class = { "TelegramDesktop", "Skype", "discord" },
          },
        },
      },
    },
    { -- 2 screens configuration
      { -- 1st screen
        { name = "0", layout = awful.layout.suit.tile, keybinding = "0", },
        { name = "2", layout = awful.layout.suit.tile, keybinding = "2", },
        { name = "7", layout = awful.layout.suit.tile, keybinding = "7", },
        { name = "8", layout = awful.layout.suit.tile, keybinding = "8", },
        { name = "9", layout = awful.layout.suit.max, keybinding = "9",
          clients = {
            class = { "TelegramDesktop", "Skype", "discord" }
          },
        },
      },
      { -- 2nd screen
        { name = "1", layout = awful.layout.suit.tile, keybinding = "1", },
        { name = "3", layout = awful.layout.suit.tile, keybinding = "3", },
        { name = "4", layout = awful.layout.suit.floating, keybinding = "4", },
        { name = "5", layout = awful.layout.suit.tile, keybinding = "5", },
        { name = "6", layout = awful.layout.suit.floating, keybinding = "6",
          clients = {
            class = { "steam.exe", "Wine", "Lutris", "Steam" },
            name = { "Steam" },
          },
        },
      },
    },
  }

  tagged.init(mytags)
end

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then -- luacheck: globals awesome
  naughty.notify({ preset = naughty.config.presets.critical,
      title = "Oops, there were errors during startup!",
    text = awesome.startup_errors }) -- luacheck: globals awesome
end

-- Handle runtime errors after startup
do
  local in_error = false
  awesome.connect_signal("debug::error", function (err) -- luacheck: globals awesome
    -- Make sure we don't go into an endless error loop
    if in_error then return end
    in_error = true

    naughty.notify({ preset = naughty.config.presets.critical,
        title = "Oops, an error happened!",
      text = tostring(err) })
    in_error = false
  end)
end
-- }}}

awful.spawn.with_shell(config_dir .. "autorun.sh")

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(config_dir .. "themes/" .. theme  .. "/theme.lua")

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.tile.left,
  awful.layout.suit.tile.bottom,
  awful.layout.suit.tile.top,
  awful.layout.suit.spiral,
  awful.layout.suit.spiral.dwindle,
  awful.layout.suit.floating,
  awful.layout.suit.max,
}
-- }}}

-- {{{ Wibar
-- Create a textclock widget
local mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
  awful.button({ }, 1, function(t) t:view_only() end),
  awful.button({ modkey }, 1, function(t)
    if client.focus then -- luacheck: globals client
      client.focus:move_to_tag(t) -- luacheck: globals client
    end
  end),
  awful.button({ }, 3, awful.tag.viewtoggle),
  awful.button({ modkey }, 3, function(t)
    if client.focus then -- luacheck: globals client
      client.focus:toggle_tag(t) -- luacheck: globals client
    end
  end),
  awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
  awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local function set_wallpaper(s)
  -- Wallpaper
  if not beautiful.wallpaper then
    return
  end

  if type(beautiful.wallpaper) == "string" then
    gears.wallpaper.maximized(beautiful.wallpaper, s)
  else
    gears.wallpaper.set(beautiful.wallpaper)
  end
end

local function wrap_widget(widget, margin, background)
  local output = {
    widget = wibox.container.margin,
    widget,
  }

  output.top = margin[1] or 0
  output.right = margin[2] or 0
  output.bottom = margin[3] or output.top
  output.left = margin[4] or output.right

  if background then
    output = {
      widget = wibox.container.background,
      bg = background,
      output,
    }

    output = {
      widget = wibox.container.margin,
      left = 5,
      right = 5,
      output,
    }
  end

  return output
end

local function add_icon(widget, icon, spacing)
  return {
    layout = wibox.layout.fixed.horizontal,
    {
      widget = wibox.container.margin,
      right = spacing,
      {
        widget = wibox.widget.textbox,
        markup = icon,
        align  = 'center',
        valign = 'center',
      },
    },
    widget,
  }
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper) -- luacheck: globals screen
awful.screen.connect_for_each_screen(function(s)
  -- Wallpaper
  set_wallpaper(s)

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
      awful.button({ }, 1, function () awful.layout.inc( 1) end),
      awful.button({ }, 3, function () awful.layout.inc(-1) end),
      awful.button({ }, 4, function () awful.layout.inc( 1) end),
    awful.button({ }, 5, function () awful.layout.inc(-1) end)))

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)

  s.systray = wibox.widget.systray()

  -- Create the wibox
  s.mywibox = awful.wibar({ position = "bottom", screen = s })

  -- Create a batery widget
  local batterywidget = awful.widget.watch('bash -c "acpi | cut -d, -f 2 | tr -d \'[:space:]\'"', 20)

  -- Add widgets to the wibox
  local background_color = beautiful.wibar_items_bg or nil
  s.mywibox:setup(wrap_widget({
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      wrap_widget(s.mylayoutbox, { 8, 12, }, background_color),
      wrap_widget(s.mytaglist, { 8, 12 }, background_color),
      wrap_widget(add_icon(mytextclock, "", 2), { 8, 12 }, background_color),
      wrap_widget(add_icon(batterywidget, "", 10), { 8, 12 }, background_color),
    },
  }, {12, 5}))
end)
-- }}}

local function unminimize_on_current_tag()
  local t = awful.screen.focused().selected_tag
  if not t then return end

  for _, client in pairs(t:clients()) do
    client.minimized = false
  end
end

-- {{{ Key bindings
local globalkeys = gears.table.join(
  root.keys(), -- luacheck: globals root
  awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
    {description = "view previous", group = "tag"}),
  awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
    {description = "view next", group = "tag"}),
  awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
    {description = "go back", group = "tag"}),

  awful.key({ modkey,           }, "j",
    function ()
      awful.client.focus.byidx( 1)
    end,
    {description = "focus next by index", group = "client"}
    ),
  awful.key({ modkey,           }, "k",
    function ()
      awful.client.focus.byidx(-1)
    end,
    {description = "focus previous by index", group = "client"}
    ),

  -- Layout manipulation
  awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
    {description = "swap with next client by index", group = "client"}),
  awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
    {description = "swap with previous client by index", group = "client"}),
  awful.key({ modkey,           }, "Tab", function () awful.screen.focus_relative( 1) end,
    {description = "focus the next screen", group = "screen"}),
  awful.key({ modkey, "Shift" }, "Tab", function () awful.screen.focus_relative(-1) end,
    {description = "focus the previous screen", group = "screen"}),
  awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
    {description = "jump to urgent client", group = "client"}),

  -- Standard program
  awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
    {description = "open a terminal", group = "launcher"}),
  awful.key({ modkey, "Shift" }, "r", awesome.restart, -- luacheck: globals awesome
    {description = "reload awesome", group = "awesome"}),
  awful.key({ modkey, "Shift"   }, "e", awesome.quit, -- luacheck: globals awesome
    {description = "quit awesome", group = "awesome"}),

  awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
    {description = "increase master width factor", group = "layout"}),
  awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
    {description = "decrease master width factor", group = "layout"}),
  awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
    {description = "increase the number of master clients", group = "layout"}),
  awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
    {description = "decrease the number of master clients", group = "layout"}),
  awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
    {description = "increase the number of columns", group = "layout"}),
  awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
    {description = "decrease the number of columns", group = "layout"}),
  awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
    {description = "select next", group = "layout"}),
  awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
    {description = "select previous", group = "layout"}),

  awful.key({ modkey            }, "p", function () awful.spawn.with_shell('physlock')      end,
    {description = "lock screen", group = "layout"}),
  awful.key({ modkey            }, "c", function () librarian.update_all()                  end,
    {description = "lock screen", group = "layout"}),
  awful.key({ modkey            }, "m", function () unminimize_on_current_tag()             end,
    {description = "uniminize all clients on current tag", group = "layout"})
)


-- Add i3wm-like navigation key bindings.
if (librarian.is_installed("vladgor/awesome-tagged")) then
  globalkeys = gears.table.join(globalkeys, tagged.get_keybindings(modkey))
end

local clientkeys = gears.table.join(
  awful.key({ modkey,           }, "f",
    function (c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    {description = "toggle fullscreen", group = "client"}),
  awful.key({ modkey, "Shift"   }, "q",      function (c) c:kill()                         end,
    {description = "close", group = "client"}),
  awful.key({ modkey, "Shift" }, "f",  awful.client.floating.toggle                     ,
    {description = "toggle floating", group = "client"}),
  awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
    {description = "move to master", group = "client"}),
  awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
    {description = "move to screen", group = "client"})
)

local clientbuttons = gears.table.join(
  awful.button({ }, 1, function (c) client.focus = c; c:raise() end),  -- luacheck: globals client
  awful.button({ modkey }, 1, awful.mouse.client.move),
  awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys) -- luacheck: globals root
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
  -- All clients will match this rule.
  { rule = { },
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = clientkeys,
      buttons = clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap+awful.placement.no_offscreen
    }
  },
}

if (librarian.is_installed("vladgor/awesome-tagged")) then
  awful.rules.rules = gears.table.join(awful.rules.rules, tagged.get_rules())
end
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c) -- luacheck: globals client
  if awesome.startup and -- luacheck: globals awesome
    not c.size_hints.user_position
    and not c.size_hints.program_position then
    -- Prevent clients from being unreachable after screen count changes.
    awful.placement.no_offscreen(c)
  end
end)

awful.titlebar.enable_tooltip = false

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c) -- luacheck: globals client
  -- buttons for the titlebar
  local buttons = gears.table.join(
    awful.button({ }, 1, function()
      client.focus = c -- luacheck: globals client
      c:raise()
      awful.mouse.client.move(c)
    end),
    awful.button({ }, 3, function()
      client.focus = c -- luacheck: globals client
      c:raise()
      awful.mouse.client.resize(c)
    end)
    )

  local titlebar = awful.titlebar.widget.titlewidget(c)
  titlebar.font = beautiful.titlebar_font
  awful.titlebar(c) : setup {
    { -- Left
      layout  = wibox.layout.fixed.horizontal
    },
    { -- Middle
      { -- Title
        align  = "center",
        widget = titlebar,
      },
      buttons = buttons,
      layout  = wibox.layout.flex.horizontal
    },
    { -- Right
      awful.titlebar.widget.ontopbutton    (c),
      awful.titlebar.widget.floatingbutton (c),
      awful.titlebar.widget.stickybutton   (c),
      awful.titlebar.widget.maximizedbutton(c),
      awful.titlebar.widget.closebutton    (c),
      layout = wibox.layout.fixed.horizontal()
    },
    layout = wibox.layout.align.horizontal
  }
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end) -- luacheck: globals client
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end) -- luacheck: globals client

-- Rounded corners
-- client.connect_signal("manage", function(c)
--     c.shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, beautiful.border_radius) end
--   end)

-- client.connect_signal("property::fullscreen", function(c) -- luacheck: globals client
--     if c.fullscreen then
--       c.shape = function(cr, w, h) gears.shape.rectangle(cr, w, h, beautiful.border_radius) end
--     else
--       c.shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, beautiful.border_radius) end
--     end
--   end)
-- }}}
