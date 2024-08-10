#!/bin/bash

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
brew install kubectl
brew install k9s
brew install pnpm
brew install rustup

echo All done! 🚀 