autoload -U colors && colors
function set-prompt()
{
  if [[ $KEYMAP = vicmd ]]; then
    vi_mode="%{$fg_bold[red]%}N"
  else
    vi_mode="%{$fg[grey]%}%%"
  fi

  gitbranch=$(git branch 2> /dev/null | sed -n '/\* /s///p')

  if [[ "$gitbranch" != "" ]]; then
    diffinfo=$(git diff --stat | tail -n 1)
    if [[ "$diffinfo" != "" ]]; then
      fileschanged=$(echo $diffinfo | cut -d, -f1 | cut -d ' ' -f2)
      if [[ $fileschanged != "" ]]; then
        fileschanged="${fileschanged}f"
      fi
      insertions=$(echo $diffinfo | cut -d, -f2 | cut -d ' ' -f2)
      if [[ $insertions != "" ]]; then
        insertions=" +${insertions}"
      fi
      deletions=$(echo $diffinfo | cut -d, -f3 | cut -d ' ' -f2)
      if [[ $deletions != "" ]]; then
        deletions=" -${deletions}"
      fi
      diffinfo="(${fileschanged}${insertions}${deletions})"
    fi
    gitbranch="%{$fg[grey]%} ${gitbranch} ${diffinfo}%{$reset_color%}"
  fi

  PROMPT="
%{$fg[black]$bg[blue]%}   %n@%m %{$reset_color%}%{$fg[blue]%}%{$reset_color%} %~ ${gitbranch}
 $vi_mode%{$reset_color%} "
}

function zle-line-init zle-keymap-select {
    set-prompt
  zle reset-prompt
}


zle -N zle-line-init
zle -N zle-keymap-select
