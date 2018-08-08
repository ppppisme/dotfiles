export EDITOR=nvim
export TERMINAL=termite
export PATH=/home/pppp/.bin/:$PATH
export PATH=$PATH:/home/pppp/.gem/ruby/2.4.0/bin/
export PATH=$PATH:/home/pppp/.config/composer/vendor/bin/

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt notify
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt extended_history
unsetopt appendhistory beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/vladgor/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

bindkey -v
export KEYTIMEOUT=1

# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history
#
# # backspace and ^h working even after
# # returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
#
# # ctrl-w removed word backwards
bindkey '^w' backward-kill-word
# # ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# No cd anymore
setopt autocd

setopt extended_glob

setopt interactive_comments

# Tab-completion from both ends of word
setopt completeinword

# One history for all open shells
setopt sharehistory
setopt extendedhistory

# Customized shell prompt
source ~/.zsh/themes/minimal.sh

# Alias section
alias ll='ls -lAh'
alias l='ls'
alias notes='vim ~/var/notes/ -c "cd ~/var/notes/" -c "FzfFiles"'
alias work='vim ~/var/notes/work -c "cd ~/var/notes/work/" -c "FzfFiles"'

# Git aliases
alias gs='git status'
alias ga='git add .'
alias gu='git add -u'
alias gc='git commit'
alias gco='git checkout'
alias gm='git merge'
alias gl='git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n""          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)" --all'
alias gd='git diff --color=always | less -r'
alias gd~='git diff HEAD~ --color=always | less -r'
alias nah="git reset --hard && git clean -df"

# Ack aliases
alias ack="ack --ignore-file=is:tags --pager 'less -r'"

alias vim="nvim"

# Misc
alias wt="curl wttr.in/omsk"

WORDCHARS='*?[]~=&;!#$%^(){}<>'

# Plugins section

# Syntax higlighting
# Must be at the end of this file
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

function go {
  eval "cd ~/src/work/$1/drupal"
}

function up {
  eval "nohup sudo -i > /dev/null && cd ~/src/work/$1 && vagrant up && vagrant ssh -c 'sudo systemctl restart nginx'"
}

function down {
  eval "nohup sudo -i > /dev/null && cd ~/src/work/$1 && vagrant halt"
}

# Brightness
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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
