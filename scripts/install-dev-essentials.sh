#!/bin/bash

if command -v apt > /dev/null; then
    PKG_MANAGER="apt"
elif command -v dnf > /dev/null; then
    PKG_MANAGER="dnf"
else
    >&2 echo "Error: Unknown package manager"
    exit 1
fi
echo "Package manager detected: $PKG_MANAGER"

echo "Installing dev packages..."
if [ "$PKG_MANAGER" == "apt" ]; then
    sudo apt update
    sudo apt install -y \
        libxkbcommon-dev
elif [ "$PKG_MANAGER" == "dnf" ]; then
    sudo dnf install -y \
        libxkbcommon-devel
fi
echo "Dev packages installed successfully."


command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install homebrew
if command_exists brew; then
    echo "Detected Homebrew installation."
    brew --version
else
    # See https://docs.brew.sh/Homebrew-on-Linux
    echo "Installing Homebrew..."
    test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
    test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc
fi
brew update

echo "Installing essential development packages..."
export HOMEBREW_NO_AUTO_UPDATE=true
brew install gitui
brew install kubectl
brew install k9s
brew install siderolabs/tap/talosctl
brew install nvm
brew install pnpm
brew install rustup
brew install just
brew install deno

echo All done! 🚀
