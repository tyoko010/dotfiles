# Installation

```bash
git clone https://github.com/tyoko010/dotfiles.git
./dotfiles/install.sh
```

## Required tools

* sheldon
* fzf

## TODO
* Sync other files

## Tools installation

### macOS

```bash
brew install sheldon fzf
```

### Windows WSL (ubuntu 22.04)

#### sheldon
```bash
sudo apt install git zsh curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sudo apt install build-essential pkg-config libssl-dev
cargo install sheldon
```

#### fzf
```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
#~/.fzf/install
```

#### for zsh highlighting
Add following in /etc/wsl.conf and restart wsl using `wsl --shutdown`
```
[interop]
appendWindowsPath = false
```

