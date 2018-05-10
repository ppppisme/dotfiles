#!/bin/sh

# trying to avoid unecessary acpi execution
src=`acpi`
procent=`echo $src | cut -d, -f2`
# get rid of leading space
procent=${procent:1}
color='#504945'

status=""
icon=""
if [[ "$procent" != "100%" ]]; then
  status=`echo $src | cut -d ' ' -f3`
  status="${status::-1}"
fi

if [[ $status = "Discharging" ]]; then
  status=" (↘)"
elif [[ $status = "Charging" ]]; then
  status=" (↗)"
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
elif [ $procent_number -ge 15 ]
then
  icon=""
else
  icon=""
fi

echo "$icon  $procent$status"
echo "$icon  $procent$status"
echo $color
