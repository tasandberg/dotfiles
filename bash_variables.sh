# Variables and some PATH setup
export EDITOR="nvim"
export HISTSIZE=15000
export CLICOLOR="auto"
export MYIP=$(ifconfig | grep inet | egrep -v "127|inet6" | awk '{print $2}')
# Initialize Path
PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH
PATH="$PATH:$HOME/.dotfiles/bin"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
