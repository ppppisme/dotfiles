
autoload -U colors && colors
function set-prompt()
{
  if [[ -z $(git diff --exit-code 2> /dev/null) ]] then
    vi_mode="%{$fg[grey]%}———"%{$reset_color%}
  else
    vi_mode="%{$fg[green]%}———"%{$reset_color%} 
  fi

  if [[ $KEYMAP = vicmd ]]; then
    vi_mode="%{$fg_bold[red]%}———"%{$reset_color%}
  fi

  gitbranch=$(git branch 2> /dev/null | sed -n '/\* /s///p') 

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
