# Variables and some PATH setup
export EDITOR="nvim"
export HISTSIZE=15000
export CLICOLOR="auto"
export BASH_SILENCE_DEPRECATION_WARNING=1

# Initialize Path
PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH
PATH="$PATH:$HOME/.dotfiles/bin"

# Initialize rbenv
eval "$(rbenv init -)"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
