#!/usr/bin/env bash
set -e

DOTFILES_DIR=$(cd $(dirname $0) && pwd)

BREW_PACKAGES=(
  # shell
  fzf
  sheldon
  ripgrep
  yq
  # virtualization
  colima
  docker
  docker-compose
  # development
  gh
  nvm
  pnpm
)

CASK_APPS=(
  iterm2
  font-fira-code-nerd-font
)

function install_brew_packages() {
  if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Please install Homebrew first."
    exit 1
  fi

  brew update

  echo "Installing packages..."
  brew install "${BREW_PACKAGES[@]}"

  echo "Installing cask apps..."
  brew install --cask "${CASK_APPS[@]}"
}

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

install_brew_packages
create_link $DOTFILES_DIR/plugins.toml ~/.config/sheldon/plugins.toml
create_link $DOTFILES_DIR/zshrc ~/.zshrc


