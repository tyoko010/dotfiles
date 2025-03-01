#!/usr/bin/env bash
set -e

DOTFILES_DIR=$(cd $(dirname $0) && pwd)

function create_link() {
  local origin=$1
  local link=$2
  if [ -e $link ]; then
    echo "Already exists: $link"
  else
    ln -s $origin $link
    echo "Created symbolic link: $link"
  fi
}

create_link $DOTFILES_DIR/plugins.toml ~/.config/sheldon/plugins.toml
create_link $DOTFILES_DIR/zshrc ~/.zshrc

BREW_PACKAGES=(
  fzf
  sheldon
  ripgrep
  gh
  yq
  colima
  docker
  docker-compose
)

CASK_APPS=(
  iterm2
)

if ! command -v brew &> /dev/null; then
  echo "Homebrew is not installed. Please install Homebrew first."
  exit 1
fi

brew update

echo "Installing packages..."
brew install "${BREW_PACKAGES[@]}"

echo "Installing cask apps..."
brew install --cask "${CASK_APPS[@]}"