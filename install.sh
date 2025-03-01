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
if [ -f /etc/wsl.conf ]; then
  create_link $DOTFILES_DIR/zshrc.wsl ~/.zshrc.wsl
fi
