local awful = require("awful")

awful.spawn.easy_async_with_shell("xrandr --output DP-0 --right-of HDMI-0 --auto")
awful.spawn.easy_async_with_shell("xrandr --output HDMI-0 --mode 2560x1080 --rate 144")
awful.spawn.easy_async_with_shell("xset m 00 r rate 250 25")
awful.spawn.easy_async_with_shell("setxkbmap -model pc104 -layout us,ru -variant qwerty -option grp:alt_shift_toggle -option caps:ctrl_modifier")
awful.spawn.easy_async_with_shell("redshift -x && redshift -O 4500")
awful.spawn.easy_async_with_shell("picom")
