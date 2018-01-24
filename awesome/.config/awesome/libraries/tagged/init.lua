------------------------------------------------------------------------------
--   _                             _
--  | |_ __ _  __ _  __ _  ___  __| |
--  | __/ _` |/ _` |/ _` |/ _ \/ _` |
--  | || (_| | (_| | (_| |  __/ (_| |
--   \__\__,_|\__, |\__, |\___|\__,_|
--            |___/ |___/
------------------------------------------------------------------------------
--
-- This library provides a functionality to assign specific tags to specific
-- screens and to bind keys/layouts to tags. Also allows to use one
-- configuration file for different screen configurations. See sample
-- settings table to get an idea:

-- local mytags = {
--   { -- 1 screen configuration
--     { -- 1st screen
--       -- tag names
--       name = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" },
--       layout = {
--         awful.layout.layouts[1], -- layout for the first tag
--         awful.layout.layouts[1], -- second
--         awful.layout.layouts[1], -- third...
--         awful.layout.layouts[1],
--         awful.layout.layouts[1],
--         awful.layout.layouts[1],
--         awful.layout.layouts[1],
--         awful.layout.layouts[1],
--         awful.layout.layouts[1],
--         awful.layout.layouts[8],
--       },
--       -- keys to bind tags to (modkey + assigned_key)
--       keybinding = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" },
--     }
--   },
--   { -- 2 screens configuration
--     { -- 1st screen
--       name = { "0", "1", "4" },
--       layout = {
--         awful.layout.layouts[1], -- 0
--         awful.layout.layouts[1], -- 1
--         awful.layout.layouts[7], -- 4
--       },
--       keybinding = { "0", "1", "4" },
--     },
--     { -- 2nd screen
--       name = { "2", "3", "5", "6", "7", "8", "9" },
--       layout = {
--         awful.layout.layouts[1], -- 2
--         awful.layout.layouts[1], -- 3
--         awful.layout.layouts[1], -- 5
--         awful.layout.layouts[1], -- 6
--         awful.layout.layouts[1], -- 7
--         awful.layout.layouts[1], -- 8
--         awful.layout.layouts[8], -- 9
--       },
--       keybinding = { "2", "3", "5", "6", "7", "8", "9" },
--     },
--   },
-- }
--
-- Copyright (C) 2018 pppp
--
-- This program is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the Free
-- Software Foundation, either version 3 of the License, or (at your option)
-- any later version.
--
-- This program is distributed in the hope that it will be useful, but WITHOUT
-- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-- FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.
--
-- You should have received a copy of the GNU General Public License along with
-- this program.  If not, see <https://www.gnu.org/licenses/>.
--

return {
  -- Properties.
  screen_configuration = { },
  awful = { },
  screen = { },
  gears = { },
  client = { },

  -- Functions.
  init = function(self, configuration, screen, awful, gears, client)
    local init_tags = function(conf)
      awful.screen.connect_for_each_screen(function(s)
        local screen_index = s.index
        awful.tag(conf[screen_index].name, s, conf[screen_index].layout)
      end)
    end

    local screen_configuration = configuration[screen.count()]

    init_tags(screen_configuration)
    self.screen_configuration = screen_configuration
    self.screen = screen
    self.awful = awful
    self.gears = gears
    self.client = client
  end,


  get_keybindings = function(self, modkey)
    local tablelength = function(T)
      local count = 0
      for _ in pairs(T) do count = count + 1 end
      return count
    end

    local output = { }
    for screen_index, s in pairs(self.screen_configuration) do -- for each screen
      for i = 1, tablelength(s.name), 1 do -- for each tag
        output = self.gears.table.join(output,
          -- View tag only.
          self.awful.key({ modkey }, s.keybinding[i],
            function ()
              self.awful.screen.focus(screen_index)
              local screen = self.screen[screen_index]
              local tag = screen.tags[i]
              if tag then
                tag:view_only()
              end
            end,
            {}),
          -- Move client to tag.
          self.awful.key({ modkey, "Shift" }, s.keybinding[i],
            function ()
              local c = self.client.focus
              if not c then
                return
              end

              local target_screen = self.screen[screen_index]
              c:move_to_screen(screen_index)
              c:move_to_tag(target_screen.tags[i])
            end,
            {})
          )
      end
    end

    return output
  end,
}
