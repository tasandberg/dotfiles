# Variables and some PATH setup
export EDITOR="nvim"
export HISTSIZE=15000
export CLICOLOR="auto"
export PATH="$PATH:$HOME/.dotfiles/bin"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(rbenv init -)"
