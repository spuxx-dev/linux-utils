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
brew install node
brew install pnpm
brew install rust

echo "Installing and setting up nvm..."
# NVM needs to be checked a bit differently because its not being installed,
# but only sourced as a shell functiion.
if [ -d "$HOME/.nvm" ]; then
    echo "nvm is already installed."
else
    brew install nvm
    echo '

export NVM_DIR="$HOME/.nvm"
  [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
  [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
' >> ~/.bashrc
fi

echo All done! 🚀 