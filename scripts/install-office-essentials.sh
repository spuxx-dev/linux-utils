if command -v apt > /dev/null; then
    PKG_MANAGER="apt"
elif command -v dnf > /dev/null; then
    PKG_MANAGER="dnf"
else
    >&2 echo "Error: Unknown package manager"
    exit 1
fi
echo "Package manager detected: $PKG_MANAGER"

echo "Installing essential office packages..."
if [ "$PKG_MANAGER" == "apt" ]; then
    sudo apt update
    sudo apt install -y \
        ocrmypdf
elif [ "$PKG_MANAGER" == "dnf" ]; then
    sudo dnf install -y \
        ocrmypdf
fi
echo "Essential office packages installed successfully."
