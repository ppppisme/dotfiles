local utils = {}
local os

-- return execution time of passed callback in msec
function utils.exec_time(fun)
  if not os then
    os = require("os")
  end

  local start = os.clock()
  fun()

  return (os.clock() - start) * 1000
end

return utils
