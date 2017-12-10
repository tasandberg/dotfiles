# Variables and some PATH setup
export EDITOR="nvim"
export HISTSIZE=15000
export CLICOLOR="auto"

# Initialize Path
PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH
PATH="$PATH:$HOME/.dotfiles/bin"
eval "$(rbenv init -)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
