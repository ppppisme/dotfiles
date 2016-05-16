
#!/bin/sh

ping -c 1 8.8.8.8 >/dev/null 2>&1 && status="on" || status="off"


echo "  is $status"
echo "  is $status"
if [[ $status = "on" ]]; then
	echo "#b8bb26"
else
	echo "#fb4934"
fi
