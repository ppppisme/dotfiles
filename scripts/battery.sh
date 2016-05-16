
#!/bin/sh

# trying to avoid unecessary acpi execution
src=`acpi`
procent=`echo $src | cut -d, -f2`
# get rid of leading space
procent=${procent:1}

status=""
icon=""
# good: #b8bb26
# medium: #fabd2f
# bad: #fb4934
color="#b8bb26"

if [[ "$procent" != "100%" ]]; then
	status=`echo $src | cut -d ' ' -f3`
	status="${status::-1}"
fi

if [[ $status = "Discharging" ]]; then
	status="(↘)"
elif [[ $status = "Charging" ]]; then
	status="(↗)"
fi

procent_number=${procent::-1}

if [ $procent_number -ge 95 ]
then
	icon=" "
elif [ $procent_number -ge 75 ]
then
	icon=""
elif [ $procent_number -ge 45 ]
then
	icon=""
	color="#fabd2f"
elif [ $procent_number -ge 15 ]
then
	icon=""
	color="#fabd2f"
else
	icon=""
	color='#fb4934'
fi

echo "$icon  $procent $status"
echo "$icon  $procent $status"
echo $color
