command_exists() {
    command -v "$1" >/dev/null 2>&1
}

if command_exists apt; then
    echo "Detected apt package manager."
    apt --version
    sudo apt update
    sudo apt upgrade -y
fi

if command_exists flatpak; then
    echo "Detected flatpak package manager."
    flatpak --version
    flatpak update -y
fi

if command_exists brew; then
    echo "Detected Homebrew installation."
    brew --version
    export HOMEBREW_NO_AUTO_UPDATE=true
    brew update
    brew upgrade
fi

echo Everything is up-to-date! 🚀 