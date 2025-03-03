# Intel macOS
if [[ -x "/usr/local/bin/brew" ]]; then
  export BREW_HOME="/usr/local"
fi

# Apple Silicon macOS
if [[ -x "/opt/homebrew/bin/brew" ]]; then
  export BREW_HOME="/opt/homebrew"

  fpath+=(${BREW_HOME}/share/zsh/site-functions(N))
fi

