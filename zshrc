#os="$(uname | tr '[:upper:]' '[:lower:]')"

# history settings
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=20000
SAVEHIST=10000

# load specific envrionment configurations
#[ -f ~/.zshrc.$os ] && . ~/.zshrc.$os
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f /etc/wsl.conf ] && source ~/.zshrc.wsl


# setup sheldon
eval "$(sheldon source)"
