local io = require("io")
local os = require("os")
local utils = require("fuzzy.utils")
local awful

local lutris = {}

local spawn_synchronously = function(command)
  local handle = io.popen(command)
  local output = handle:read("*all")
  output = output:gsub("%c$", "")
  handle:close()

  return output
end

function lutris.source()
  local lines = spawn_synchronously("lutris -lo")

  local output = {}
  for line in lines:gmatch("(.-)%c") do
    local temp = {}
    for part in line:gmatch("[^%|]+") do
      table.insert(temp, part)
    end

    table.insert(output, {
        title = utils.trim(temp[2]),
        value = utils.trim(temp[1]),
        image = os.getenv("HOME") .. "/.local/share/icons/hicolor/128x128/apps/lutris_" .. utils.trim(temp[3]) .. ".png",
        description = utils.trim(temp[4]),
      })
  end

  return output
end

function lutris.handler(item)
  if not awful then
    awful = require("awful")
  end

  awful.spawn("lutris lutris:rungameid/" .. item.value)
end

return lutris
