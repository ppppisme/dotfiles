# Adjust brightness
function br {
  if [ -z "$1" ]; then
    echo -e "\033[0;31mNo brightness level provided\033[0m"

    return
  fi

  xbacklight -set "$1" 2> /dev/null

  if [ $? ]; then
    return
  fi

  if [ ! -f /sys/class/backlight/intel_backlight/brightness ]; then
    echo -e "\033[0;31mFailed to change brightness\033[0m"

    return
  fi
  if [ ! -f /sys/class/backlight/intel_backlight/max_brightness ]; then
    echo -e "\033[0;31mFailed to change brightness\033[0m"

    return
  fi

  max_brightness=$(head -1 /sys/class/backlight/intel_backlight/max_brightness)
  sudo tee /sys/class/backlight/intel_backlight/brightness <<< $(( max_brightness * $1 / 100  )) > /dev/null
}

# Bring up a project
function up {
  cd "$HOME/src/work/$1" && ./start.sh && cd "$PWD/app" || exit
}

function play {
  [[ $2 ]] && volume=$2 || volume=50
  mpv --no-vid --volume=$volume --gapless-audio "$1"
}
