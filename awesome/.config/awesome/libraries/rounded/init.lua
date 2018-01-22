--
-- Rounded
--
-- Make borders of all clients round.
-- Initial script author: actionless
-- (https://github.com/awesomeWM/awesome/issues/920). Thank you, actionless!

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

local function init(client, radius, gears, beautiful)
  local function apply_rounded_corners(client, radius, gears, beautiful)
    local border_width = beautiful.border_width
    local border_radius = radius or beautiful.border_radius

    gears.surface.apply_shape_bounding(client, gears.shape.rounded_rect, border_radius)
    local geometry = client:geometry()
    local shape_clip = gears.surface.load_from_shape(geometry.width - border_width * 2, geometry.height - border_width * 2, gears.shape.rounded_rect, nil, nil, border_radius)
    client.shape_clip = shape_clip._native
  end

  client.connect_signal("property::geometry", function (c)
    if not c.fullscreen then
      apply_rounded_corners(c, radius, gears, beautiful)
    end
  end)
  client.connect_signal("property::size", function (c)
    if not c.fullscreen then
      apply_rounded_corners(c, radius, gears, beautiful)
    end
  end)

end

return { init = init }
