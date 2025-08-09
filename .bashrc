# Make files executable
chmod +x ~/linux-utils/scripts/*.sh

# Aliases
alias resource='source ~/.bashrc'
alias install-essentials='~/linux-utils/scripts/install-essentials.sh'
alias install-dev-essentials='~/linux-utils/scripts/install-dev-essentials.sh'

alias update='~/linux-utils/scripts/run-updates.sh'
alias backup='~/linux-utils/scripts/backup.sh'
alias check-port='f() { do netstat -tulpn | grep $1; unset -f f; }; f'
alias zed='flatpak run dev.zed.Zed'

# Office aliases
alias install-office-essentials='~/linux-utils/scripts/install-office-essentials.sh'
alias run-ocr='~/linux-utils/scripts/run-ocr.sh'

# Other aliases
alias spotify='flatpak run com.spotify.Client --force-device-scale-factor'
alias spotify2x='flatpak run com.spotify.Client --force-device-scale-factor=2'
alias clear-db-wifi='sudo ip -4 addr del 172.18.0.1/16 dev br-9e9ad0e1c753' # May help when train wifi won't connect :-)

# PATH includes
export PATH=$PATH:/home/linuxbrew/.linuxbrew/opt/rustup/bin

# Set kubectl editor to nano
export KUBE_EDITOR=nano

# Export UID/GID
# if [ -z "${UID}" ] || [ -z "${GID}" ]; then
#   export UID=$(id -u)
#   export GID=$(id -g)
# fi

# Export Node options
# export NODE_OPTIONS="$NODE_OPTIONS --preserve-symlinks"
export NVM_DIR="$HOME/.nvm"
  [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
  [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
