CONFIG_DIR="$HOME/.config/zsh"
[ -f "$CONFIG_DIR"/.zsh/local.sh ] && source "$CONFIG_DIR"/.zsh/local.sh || source "$CONFIG_DIR"/.zsh/local.default.sh

autoload -Uz compinit
zmodload zsh/complist

compinit -d "$CONFIG_DIR"/.zsh/tmp/completion-cache
zstyle ':completion:*' menu select
setopt list_rows_first

# keys
WORDCHARS='*?[]~=&;!#$%^(){}<>'
export KEYTIMEOUT=1
bindkey -v

bindkey -M menuselect '^P' expand-or-complete
bindkey -M menuselect '^N' reverse-menu-complete

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

HISTFILE="$CONFIG_DIR"/.zsh/tmp/history
HISTSIZE=10000
SAVEHIST=10000

setopt completeinword
setopt always_to_end
setopt extendedhistory
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
unsetopt beep
unsetopt no_hup
unsetopt flow_control

# theme
source "$CONFIG_DIR"/.zsh/themes/minimal.sh

# includes
source "$CONFIG_DIR"/.zsh/variables.sh
source "$CONFIG_DIR"/.zsh/aliases.sh
source "$CONFIG_DIR"/.zsh/functions.sh
source "$CONFIG_DIR"/.zsh/bookmarks.sh
source "$CONFIG_DIR"/.zsh/autotitle.sh
