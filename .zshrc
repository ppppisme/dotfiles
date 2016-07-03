# don't forget to install zsh-completions!


export EDITOR=vim
export PATH=$PATH:/home/vladgor/.gem/ruby/2.3.0/bin/
export XDG_CONFIG_HOME=$HOME/.config

# export EDITOR=vim
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
		
autoload -U colors && colors
function set-prompt() 
{
	if [[ $KEYMAP = vicmd ]]; then
		vi_mode="%{$fg_bold[red]%}N"
	else
		vi_mode="%{$fg[grey]%}%%"
	fi

	gitbranch=$(git branch | sed -n '/\* /s///p')

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

# Alias section
alias ll='ls -lah'
alias l='ls'
alias rw='sudo modprobe -r rtl8723be && sudo modprobe rtl8723be && sudo netctl start home'
alias ya="yaourt"
alias notes="vim ~/Dropbox/notes/"
alias dirs="dirs -v"
alias tmux="tmux -2"

WORDCHARS='*?[]~=&;!#$%^(){}<>'

# Plugins section

# Syntax higlighting
# Must be at the end of this file
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
