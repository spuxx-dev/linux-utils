# Make files executable
chmod +x ~/linux-utils/scripts/*.sh

# Aliases
alias resource='source ~/.bashrc'
alias install-essentials='~/linux-utils/scripts/install-essentials.sh'
alias install-dev-essentials='~/linux-utils/scripts/install-dev-essentials.sh'
alias update='~/linux-utils/scripts/run-updates.sh'
alias backup='~/linux-utils/scripts/backup.sh'
alias check-port='f() { do netstat -tulpn | grep $1; unset -f f; }; f'
alias flux-reconcile='flux reconcile source git flux-system; flux reconcile kustomization flux-system'

# Other aliases
alias spotify='flatpak run com.spotify.Client --force-device-scale-factor'
alias spotify2x='flatpak run com.spotify.Client --force-device-scale-factor=2'

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
