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

  vi_mode="$color:::"%{$reset_color%}

  # If vim is running in background -- show indicator.
  if [[ $(jobs | grep -E 'nvim|vim|vi') ]]; then
    vi_mode="$vi_mode %{$fg_bold[yellow]%}vim%{$reset_color%}"
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
