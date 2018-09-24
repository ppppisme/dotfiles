[ -f ~/.zsh/local.sh ] && source ~/.zsh/local.sh || source ~/.zsh/local.default.sh

GOTO_DIRS=( \
  "$HOME/src/work" \
  "$HOME/mnt/media/music/library"
)

# init completion engine
fpath=(~/.zsh/fpath $fpath)

autoload -Uz compinit
compinit -d ~/.zsh/tmp/completion-cache
zstyle ':completion:*' menu select
# zstyle ':completion:*' matcher-list 'r:|?=** m:{a-z\-}={A-Z\_}'
setopt list_rows_first

# keys
WORDCHARS='*?[]~=&;!#$%^(){}<>'
export KEYTIMEOUT=1
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

HISTFILE=~/.zsh/tmp/history
HISTSIZE=10000
SAVEHIST=10000

setopt completeinword
setopt always_to_end
setopt menu_complete
setopt extendedhistory
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
unsetopt beep
unsetopt no_hup
unsetopt flow_control

# theme
source ~/.zsh/themes/minimal.sh

# includes
source ~/.zsh/aliases.sh
source ~/.zsh/functions.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
