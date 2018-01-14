--
-- Titlebar manager
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

-- {{{ Helper functions
local function setTitlebar(awful, client, s)
  if s then
    if client.titlebar == nil then
      client:emit_signal("request::titlebars", "rules", {})
    end
    awful.titlebar.show(client)
  else
    awful.titlebar.hide(client)
  end
end
-- }}}

local function init(awful, client, tag)
  client.connect_signal("property::floating", function(c)
    setTitlebar(awful, c, c.floating)
  end)
  client.connect_signal("manage", function(c)
    setTitlebar(awful, c, c.floating or c.first_tag.layout == awful.layout.suit.floating)
  end)

  tag.connect_signal("property::layout", function(t)
    for _, c in pairs(t:clients()) do
      if t.layout == awful.layout.suit.floating then
        setTitlebar(awful, c, true)
      else
        setTitlebar(awful, c, false)
      end
    end
  end)
end

return { init = init }
