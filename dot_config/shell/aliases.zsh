# Tracked aliases (managed by chezmoi)

# Dotfiles management
alias aliaz="dotfiles edit aliases"
alias aliazl="dotfiles edit local"
alias brefresh="chezmoi apply && source ~/.zshrc"
alias cddf="cd $(chezmoi source-path)"

# General
alias p="pnpm"
alias vim="nvim"
alias l="ls -a"

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

dsh() {
  docker exec -it $1 /bin/bash
}

# Tmux
alias tat="tmux a -d -t"
alias tater="tmuxinator"
