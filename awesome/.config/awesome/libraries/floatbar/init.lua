--    __ _             _   _
--   / _| | ___   __ _| |_| |__   __ _ _ __
--  | |_| |/ _ \ / _` | __| '_ \ / _` | '__|
--  |  _| | (_) | (_| | |_| |_) | (_| | |
--  |_| |_|\___/ \__,_|\__|_.__/ \__,_|_|
--
--
-- Show titlebar only for floating clients.
-- Initial script author: Niverton (https://stackoverflow.com/a/44120615). Thank
-- you Niverton!

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
  init = function(self, awful, client, tag)
    local set_titlebar = function(c, s)
      if s then
        if c.titlebar == nil then
          c:emit_signal("request::titlebars", "rules", {})
        end
        awful.titlebar.show(c)
      else
        awful.titlebar.hide(c)
      end
    end

    client.connect_signal("property::floating", function(c)
      set_titlebar(c, c.floating)
    end)
    client.connect_signal("manage", function(c)
      set_titlebar(c, c.floating or c.first_tag.layout == awful.layout.suit.floating)
    end)

    tag.connect_signal("property::layout", function(t)
      for _, c in pairs(t:clients()) do
        set_titlebar(c, t.layout == awful.layout.suit.floating)
      end
    end)
  end
}
