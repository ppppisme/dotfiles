# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob notify
unsetopt appendhistory beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/vladgor/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# Customized shell prompt
autoload -U colors && colors
PROMPT="
%{$fg[black]%}%{$bg[blue]%}   %n@%m %{$reset_color%}%{$fg[blue]%}%{$reset_color%} %~
 %{$fg[grey]%}%%%{$reset_color%} "
