local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")

return {
  __libraries = { },

  __has_item = function(table, wanted_item)
    for _, item in pairs(table) do
      if (item == wanted_item) then
        return true
      end
    end

    return false
  end,

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

  clean = function(self)
    naughty.notify({
        title = "Librarian",
        text = "Removing not used libraries...",
      })

    local config_dir = gears.filesystem.get_configuration_dir()

    local find_command = "cd " .. config_dir .. "libraries && "
    find_command = find_command .. "find -mindepth 2 -maxdepth 2 -type d"

    -- make a list of directories
    awful.spawn.easy_async_with_shell(find_command, function(stdout)
      local directories_list = stdout:gsub("%./", "")

      for directory in directories_list:gmatch("(.-)%c") do
        local is_registered = false

        if (not self:__has_item(self.__libraries, directory)) then
          local remove_command = "rm -rf " .. config_dir .. "libraries/" .. directory
          naughty.notify({
              title = "Librarian",
              text = remove_command,
            })
          awful.spawn(remove_command)
        end
      end
    end)
  end,

  require = function(self, library_name)
    table.insert(self.__libraries, library_name)

    if (not self:is_installed(library_name)) then
      local notification = naughty.notify({
          title = "Librarian",
          text = "Installing " .. library_name .. " library. This message will disappear when the process is done.",
          timeout = 0,
        })
      self:__download(library_name, notification)

      return nil
    end

    local config_dir = gears.filesystem.get_configuration_dir()
    local author = string.match(library_name, "[^/]+")
    package.path = config_dir .. "libraries/" .. author .. "/?/init.lua;" .. package.path
    package.path = config_dir .. "libraries/" .. author .. "/?.lua;" .. package.path

    return require('libraries/' .. library_name)
  end,
}
