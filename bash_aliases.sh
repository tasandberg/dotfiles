# General Aliases
alias cddf="cd ~/.dotfiles"
alias be="bundle exec"
alias ber="bundle exec rails"
alias gco="git checkout"
alias grco="git recentco"
alias gpu='git push -u origin'
alias aliaz="vim ~/.dotfiles/bash_aliases.sh"
alias aliazl="vim ~/.bashrc"
alias com="git commit -m"
alias gs="git status"
alias lg="git lg"
alias rs="be rspec --format documentation"
alias r="rails"
alias l='ls -a'
alias lg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias brefresh='source ~/.bashrc'

# Tmux Aliases
# Remember to add "source-file ~/.dotfiles/.tmux.conf" to ~/.tmux.conf
alias tmuxconf="vim ~/.dotfiles/tmux.conf"
alias tat="tmux a -t"

# Vim Aliases
alias vimconf="vim ~/.dotfiles/vimconfig.vim"

# Docker Aliases
alias dc="docker container"
alias dcs="docker container ls"
alias dis="docker images"
alias di="docker image"
alias dcom="docker-compose"
alias dcup="docker-compose up"
alias dcdn="docker-compose down --remove-orphans"

dsh()
{
  docker exec -it $1 /bin/bash
}

