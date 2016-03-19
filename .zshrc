# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob notify
unsetopt appendhistory beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/vladgor/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Advanced completion
# autoload -U compinit
# compinit

# Tab-completion from both ends of word
setopt completeinword


# One history for all open shells
setopt sharehistory
setopt extendedhistory

# Customized shell prompt
autoload -U colors && colors
PROMPT="
%{$fg[black]$bg[blue]%}   %n@%m %{$reset_color%}%{$fg[blue]%}%{$reset_color%} %~ 
 %{$fg[grey]%}%%%{$reset_color%} "


# Alias section
alias ll='ls -lah'
alias l='ls'
alias rw='modprobe -r rtl8723be && modprobe rtl8723be'


# Plugins section

# Shadowed history-based autocompletion
# ^e to accept completion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=0

# Syntax higlighting
# Must be at the end of this file
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
