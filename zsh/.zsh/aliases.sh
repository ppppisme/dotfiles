# Git
alias gs='git status'
alias gc='git commit'
alias gca='git commit --amend'
alias gco='git checkout'
alias gm='git merge'
alias gl='git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n""          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)" --all'
alias gd='git diff --color=always | less -r'
alias gd~='git diff HEAD~ --color=always | less -r'
alias gp='git pull --ff-only'
alias nah="git reset --hard && git clean -df"

function gdh {
  git diff "$1" HEAD
}

# Misc
alias j=xdg-open
alias f=fff
alias vim=nvim
alias scrot='maim -s | xclip -selection clipboard -t image/png'
alias wt='curl wttr.in'
alias dc=docker-compose
