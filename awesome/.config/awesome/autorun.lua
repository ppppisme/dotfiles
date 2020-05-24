local awful = require('awful')

awful.spawn.with_shell("xset m 00 r rate 250 25")
awful.spawn.with_shell("setxkbmap -model pc104 -layout us,ru -variant qwerty -option grp:alt_shift_toggle -option caps:ctrl_modifier")
awful.spawn.with_shell("redshift -x && redshift -O 4500")
awful.spawn.with_shell("picom")
