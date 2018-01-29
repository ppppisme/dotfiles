local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")

return {
  __download = function(self, library_name, notification)
    local config_dir = gears.filesystem.get_configuration_dir()
    local command ="git clone https://github.com/" .. library_name .. ".git"
    command = command .. " " .. config_dir .. "libraries/" .. library_name .. "/"

    awful.spawn.easy_async(command, function(stdout, stderr, reason, exit_code)
      if (exit_code ~= 0) then
        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Librarian",
            text = stderr,
          })
      end

      if (notification == nil) then
        return
      end

      naughty.destroy(notification)
    end)
  end,

  is_installed = function(self, library_name)
    -- @see https://stackoverflow.com/a/40195356
    local exists = function (file)
      local ok, err, code = os.rename(file, file)
      if not ok then
        if code == 13 then return true end
      end
      return ok
    end

    local config_dir = gears.filesystem.get_configuration_dir()
    return exists(config_dir .. "libraries/" .. library_name .. "/init.lua")
  end,

  require = function(self, library_name)
    if (not self:is_installed(library_name)) then
      local notification = naughty.notify({
          title = "Librarian",
          text = "Installing " .. library_name .. " library. This message will disappear when the process is done.",
          timeout = 0,
        })
      self:__download(library_name, notification)

      return nil
    end

    return require('libraries/' .. library_name)
  end,
}
