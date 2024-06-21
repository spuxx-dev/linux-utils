# Aliases
alias resource='source ~/.bashrc'
alias install-essentials='~/linux-utils/scripts/install-essentials.sh'
alias check-port='f() { sudo netstat -tulpn | grep \$1; unset -f f; }; f'