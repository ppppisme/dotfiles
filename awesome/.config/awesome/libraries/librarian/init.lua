return {
  -- @see http://lua-users.org/wiki/SplitJoin
  __split = function(str, pat)
    local tbl={}
    str:gsub(pat,function(x) tbl[#tbl+1]=x end)
    return tbl
  end,

  __download = function(self, library_name)
    local config_dir = self.gears.filesystem.get_configuration_dir()
    local command ="git clone https://www.github.com/" .. library_name
    command = command .. ' ' .. config_dir .. "libraries/" .. library_name .. "/"

    -- doing this synchronously, because we need to download the library before
    -- sourcing and returning it
    os.execute(command)
  end,

  installed = function(self, library_name)
    -- @see https://stackoverflow.com/a/40195356
    local exists = function (file)
      local ok, err, code = os.rename(file, file)
      if not ok then
        if code == 13 then return true end
      end
      return ok
    end

    local config_dir = self.gears.filesystem.get_configuration_dir()
    return exists(config_dir .. "libraries/" .. library_name .. "/")
  end,

  require = function(self, library_name)
    if (not self:installed(library_name)) then
      self.naughty.notify({ text = "Installing " .. library_name .. " library. Please, wait..." })
      self:__download(library_name)
    end

    return require('libraries/' .. library_name)
  end,

  init = function(self, awful, naughty, gears)
    self.awful = awful;
    self.naughty = naughty
    self.gears = gears
  end,
}
