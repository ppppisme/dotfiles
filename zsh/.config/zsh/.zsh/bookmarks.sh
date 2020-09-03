#!/bin/zsh

# This is lightweight version of bashmarks plugin:
# https://github.com/huyng/bashmarks/blob/master/bashmarks.sh

BOOKMARKS_FILE="$HOME"/var/bashmarks

if [ ! -f "$BOOKMARKS_FILE" ]; then
  echo "# example line:" >> "$BOOKMARKS_FILE"
  echo "# export DIR_{bookmark_name}={path}" >> "$BOOKMARKS_FILE"
fi

source "$BOOKMARKS_FILE"

function g {
  target="$(eval $(echo echo $(echo \$DIR_$1)))"

  if [ -d "$target" ]; then
    cd "$target"
  fi
}

function ge {
  echo 'export DIR_{{++}}=$HOME/{{++}}' >> "$BOOKMARKS_FILE"
  $EDITOR "$BOOKMARKS_FILE"
  source "$BOOKMARKS_FILE"
}

function _l {
    source $BOOKMARKS_FILE
    env | grep "^DIR_" | cut -c5- | sort | grep "^.*=" | cut -f1 -d "="
}

function _comp {
    local curw
    COMPREPLY=()
    curw=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=($(compgen -W '`_l`' -- $curw))
    return 0
}

function _compzsh {
    reply=($(_l))
}

if [ $ZSH_VERSION ]; then
    compctl -K _compzsh g
else
    shopt -s progcomp
    complete -F _comp g
fi
