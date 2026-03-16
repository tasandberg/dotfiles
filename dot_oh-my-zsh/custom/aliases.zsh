# Universal aliases — loaded on all hosts

# Git
alias gs="git status"
alias gco="git checkout"
alias grco="git recentco"
alias gpu="git push -u origin"
alias com="git commit -m"
alias lg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Ruby/Rails
alias be="bundle exec"
alias ber="bundle exec rails"
alias r="rails"
alias rs="be rspec --format documentation"

# Docker
alias dc="docker container"
alias dcs="docker container ls"
alias dis="docker images"
alias di="docker image"
alias dcom="docker compose"
alias dcup="docker compose up"
alias dcdn="docker compose down --remove-orphans"
alias dcr="dcom run --rm -it"

dsh() {
  docker exec -it $1 /bin/bash
}

# General
alias l="ls -a"
alias vim="nvim"
alias brefresh="omz reload"

# Tmux
alias tat="tmux a -d -t"
alias tater="tmuxinator"
