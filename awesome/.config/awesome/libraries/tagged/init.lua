return {

  screen_configuration = { },
  awful = { },
  screen = { },
  gears = { },
  client = { },

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
