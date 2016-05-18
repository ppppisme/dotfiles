
#!/bin/sh

ping -c 1 8.8.8.8 >/dev/null 2>&1 && status="on" || status="off"

if [[ $status = "on" ]]; then
	color="#b8bb26"
	text=`iwgetid -r`
else
	color="#fb4934"
	text="is off"
fi

echo "  $text"
echo "  $text"
echo $color
