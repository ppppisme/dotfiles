--
-- Rounded
--
-- Make borders of all clients round.
--
-- Initial script author: actionless
-- (https://github.com/actionless/awesome_config/blob/devel/config/signals.lua).
-- Thank you, actionless!
--
-- NOTE: do not forget to turn off borders for clients as they are not
-- compatible with this script, otherwise it will be clipped. You can still set
-- the `beautiful` variables though, this script will use them.

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

local function init(client, radius, gears, beautiful, cairo)
  local function apply_shape(c, shape, outer_shape_args, inner_shape_args)
    local geo = c:geometry()

    local border = beautiful.border_width
    local titlebar_height = border

    local img = cairo.ImageSurface(cairo.Format.A1, geo.width, geo.height)
    local cr = cairo.Context(img)

    cr:set_operator(cairo.Operator.CLEAR)
    cr:set_source_rgba(0,0,0,1)
    cr:paint()
    cr:set_operator(cairo.Operator.SOURCE)
    cr:set_source_rgba(1,1,1,1)

    shape(cr, geo.width, geo.height, outer_shape_args)
    cr:fill()
    c.shape_bounding = img._native

    cr:set_operator(cairo.Operator.CLEAR)
    cr:set_source_rgba(0,0,0,1)
    cr:paint()
    cr:set_operator(cairo.Operator.SOURCE)
    cr:set_source_rgba(1,1,1,1)

    gears.shape.transform(shape):translate(
      border, titlebar_height
      )(
      cr,
      geo.width - border * 2,
      geo.height - titlebar_height - border,
      inner_shape_args)
    cr:fill()
    c.shape_clip = img._native

    img:finish()
  end

  client.connect_signal("property::geometry", function (c)
    if not c.fullscreen then
      local border_radius = radius or beautiful.border_radius
      apply_shape(c, gears.shape.rounded_rect, border_radius, border_radius)
    end
  end)
  client.connect_signal("property::size", function (c)
    if not c.fullscreen then
      local border_radius = radius or beautiful.border_radius
      apply_shape(c, gears.shape.rounded_rect, border_radius, border_radius)
    end
  end)

end

return { init = init }
