
#!/bin/bash


pppp=`deadbeef --nowplaying-tf "%artist% — %title% \[%playback_time%\/%length%]" 2> /dev/null`

if [[ ${pppp:1:1} != "—" ]]; then  # if deadbeef is on
	echo "♫ "$pppp
	echo $pppp
	echo "#b8bb26"
fi
