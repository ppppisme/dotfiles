#compdef goto

_goto() {
  [ -z "$GOTO_DIRS" ] && return

  local dirs=$(IFS=$' '; echo ${GOTO_DIRS[*]})
  local results=`find $(echo $dirs) -mindepth 1 -maxdepth 1 -type d -printf "%f\0" 2> /dev/null | xargs --null printf '%q '`

  eval compadd "$@" $(echo $results)
}

_goto "$@"
