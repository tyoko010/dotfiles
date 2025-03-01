#os="$(uname | tr '[:upper:]' '[:lower:]')"

# history settings
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=20000
SAVEHIST=10000

# for apple silicon macs
fpath+=(/opt/homebrew/share/zsh/site-functions(N))

# load specific envrionment configurations
#[ -f ~/.zshrc.$os ] && . ~/.zshrc.$os
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# setup sheldon
eval "$(sheldon source)"
