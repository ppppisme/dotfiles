# don't forget to install zsh-completions!


export EDITOR=vim
export PATH=$PATH:/home/vladgor/.gem/ruby/2.3.0/bin/

# export EDITOR=vim
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
function set-prompt() 
{
	if [[ $KEYMAP = vicmd ]]; then
		vi_mode="%{$fg_bold[red]%}N"
	else
		vi_mode="%{$fg[grey]%}%%"
	fi
	PROMPT="
%{$fg[black]$bg[blue]%}   %n@%m %{$reset_color%}%{$fg[blue]%}%{$reset_color%} %~
 $vi_mode%{$reset_color%} "
}

function zle-line-init zle-keymap-select {
    set-prompt
	zle reset-prompt
}


zle -N zle-line-init
zle -N zle-keymap-select


# Alias section
alias ll='ls -lah'
alias l='ls'
alias rw='sudo modprobe -r rtl8723be && sudo modprobe rtl8723be'
alias ya="yaourt"
alias notes="vim ~/Dropbox/notes/"


WORDCHARS='*?[]~=&;!#$%^(){}<>'



# Plugins section

# Shadowed history-based autocompletion
# ^e to accept completion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=0

# Syntax higlighting
# Must be at the end of this file
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
