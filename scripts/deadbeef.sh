
#!/bin/bash


pppp=`deadbeef --nowplaying-tf "%artist% — %title% \[%playback_time%\/%length%]" 2> /dev/null`

# if deadbeef is on
if [[ ${pppp:1:1} != "—" ]]; then
	echo "♫ "$pppp
fi
