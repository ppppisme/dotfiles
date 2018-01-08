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

-- Add titlebar to floating windows. Thanks, Niverton!
-- https://stackoverflow.com/a/44120615
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
