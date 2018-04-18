autoload -U colors && colors

function minimal_indicator()
{
  local color="%F{8}"
  if [[ $(git diff --exit-code 2> /dev/null) ]] then
    color="%{$fg[green]%}"
  fi

  if [[ $KEYMAP = vicmd ]]; then
    color="%{$fg_bold[red]%}"
  fi

  echo "$color:::%{$reset_color%}"
}

function minimal_path()
{
  echo "%~"
}

function minimal_git_branch()
{
  local gitbranch=$(git branch 2> /dev/null | sed -n '/\* /s///p')

  if [[ -z $gitbranch ]]; then
    echo ''
    exit
  fi

  echo "%F{15}$gitbranch%{$reset_color%}"
}

function minimal_vim_running()
{
  # If vim is running in background -- show indicator.
  if [[ $(jobs | grep -E 'nvim|vim|vi') ]]; then
    echo "%{$fg_bold[yellow]%}vim%{$reset_color%}"
    exit
  fi

  echo ""
}

function set-prompt()
{
  components=(
    'minimal_indicator'
    'minimal_path'
    'minimal_git_branch'
    'minimal_vim_running'
  )

  PROMPT=''
  for fn in "${components[@]}"
  do
    result=$($fn)
    if [[ $result ]]; then
      PROMPT="$PROMPT$result "
    fi
  done

  PROMPT="
 $PROMPT
  "
}

function zle-line-init zle-keymap-select {
  set-prompt
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
