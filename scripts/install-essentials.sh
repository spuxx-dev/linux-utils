if command -v apt > /dev/null; then
    PKG_MANAGER="apt"
elif command -v dnf > /dev/null; then
    PKG_MANAGER="dnf"
else
    >&2 echo "Error: Unknown package manager"
    exit 1
fi
echo "Package manager detected: $PKG_MANAGER"

echo "Installing essential packages..."
if [ "$PKG_MANAGER" == "apt" ]; then
    sudo apt update
    sudo apt install -y \
        build-essential \
        net-tools \
        curl \
        git \
        wget
elif [ "$PKG_MANAGER" == "dnf" ]; then
    sudo dnf install -y \
        @development-tools \
        net-tools \
        curl \
        git \
        wget
fi
echo "Essential packages installed successfully."