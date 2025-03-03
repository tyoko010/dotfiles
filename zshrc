#os="$(uname | tr '[:upper:]' '[:lower:]')"

# load specific envrionment configurations
#[ -f ~/.zshrc.$os ] && . ~/.zshrc.$os
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# setup sheldon
eval "$(sheldon source)"
