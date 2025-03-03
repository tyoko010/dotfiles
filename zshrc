#os="$(uname | tr '[:upper:]' '[:lower:]')"

# for apple silicon macs
fpath+=(/opt/homebrew/share/zsh/site-functions(N))

# load specific envrionment configurations
#[ -f ~/.zshrc.$os ] && . ~/.zshrc.$os
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# setup sheldon
eval "$(sheldon source)"
