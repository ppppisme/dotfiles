local utils = {}
local os
local naughty

-- return execution time of passed callback in msec
function utils.exec_time(fun)
  if not os then
    os = require("os")
  end

  local start = os.clock()
  fun()

  return (os.clock() - start) * 1000
end

function utils.dump(table)
  if not naughty then
    naughty = require("naughty")
  end

  local function dump(t)
    if type(t) == "table" then
        local s = "{ "
        for k, v in pairs(t) do
          if type(k) ~= "number" then k = '"'..k..'"' end
          s = s .. "["..k.."] = " .. dump(v) .. ","
        end
        return s .. "} "
    end

    return tostring(t)
  end

  naughty.notify { text = dump(table), timeout = 0 }
end

return utils
