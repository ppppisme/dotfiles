# Go to project
# TODO:
# * check different folders and go to the first occurence
# * add autocompletion
function goto {
  for dir in $GOTO_DIRS; do
    cd "$dir/$1" 2> /dev/null && return
  done
}

# Adjust brightness
function br {
  if [ -z $1 ]; then
    echo -e "\033[0;31mNo brightness level provided\033[0m"

    return
  fi

  xbacklight -set $1 2> /dev/null

  if [ $? -eq 0 ]; then
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

  max_brightness=`head -1 /sys/class/backlight/intel_backlight/max_brightness`
  sudo tee /sys/class/backlight/intel_backlight/brightness <<< $(( $max_brightness / 100 * $1 )) > /dev/null
}

# Bring up a project
function up {
  current_dir=`pwd`
  cd ~/src/work/$1

  [[ `systemctl is-active postgresql.service` == "active" ]] || sudo systemctl start postgresql.service
  $TERMINAL -e $SHELL -c "yarn watch" & disown
  $TERMINAL -e $SHELL -c "php -S localhost:8000 -t ./public" & disown
}

function play {
  [[ $2 ]] && volume=$2 || volume=50
  mpv --no-vid --volume $volume --gapless-audio "$1"
}
