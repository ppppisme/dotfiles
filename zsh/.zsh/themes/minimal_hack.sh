autoload -U colors && colors
function set-prompt()
{
  color=%{$fg[grey]%}
  if [[ $(git diff --exit-code 2> /dev/null) ]] then
    color=%{$fg[green]%}
  fi

  if [[ $KEYMAP = vicmd ]]; then
    color=%{$fg_bold[red]%}
  fi

  gitbranch=$(git branch 2> /dev/null | sed -n '/\* /s///p')
  vi_mode="$color:::"%{$reset_color%}

  PROMPT="
 $vi_mode %~ %{$fg[grey]%}$gitbranch%{$reset_color%}
  "
}

function zle-line-init zle-keymap-select {
  set-prompt
  zle reset-prompt
}


zle -N zle-line-init
zle -N zle-keymap-select
