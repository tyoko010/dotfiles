#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR=$(cd $(dirname $0) && pwd)

BREW_PACKAGES=(
  # shell
  fzf
  sheldon
  ripgrep
  jq
  yq
  # virtualization
  colima
  docker
  docker-compose
  # development
  gh
  git
  # node
  volta
  # python
  uv
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

  brew cleanup
}

function create_link() {
  local origin=$1
  local link=$2
  if [ -e $link ]; then
    echo "Already exists: ${link}"
  else
    ln -s $origin $link
    echo "Created symbolic link: ${link}"
  fi
}

# Install Homebrew packages
install_brew_packages

# Install Rust
"${DOTFILES_DIR}/bin/bootstrap-rust.sh"

# Create symbolic links for dotfiles
mkdir -p ~/.config/sheldon
create_link "${DOTFILES_DIR}/plugins.toml" ~/.config/sheldon/plugins.toml
create_link "${DOTFILES_DIR}/zshrc" ~/.zshrc


