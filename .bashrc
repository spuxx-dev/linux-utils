# Make files executable
chmod +x ~/linux-utils/scripts/*.sh

# Aliases
alias resource='source ~/.bashrc'
alias install-essentials='~/linux-utils/scripts/install-essentials.sh'
alias install-dev-essentials='~/linux-utils/scripts/install-dev-essentials.sh'
alias update='~/linux-utils/scripts/run-updates.sh'
alias check-port='f() { do netstat -tulpn | grep $1; unset -f f; }; f'

