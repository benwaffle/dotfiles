antigen bundle archlinux
antigen bundle command-not-found

alias gov='sudo cpupower frequency-set -g'
alias pmb='./pmbootstrap.py --details-to-stdout'
alias sys='sudo systemctl'
alias usys='systemctl --user'
alias clip='xsel --clipboard'

# disable wifi power managment for laptop
alias nopwm='sudo iw dev wlp2s0 set power_save off'

[ -f /etc/profile.d/vte.sh ] && source /etc/profile.d/vte.sh

if [ -n "$DESKTOP_SESSION" ]; then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

function nycvpn() {
    nordvpn disconnect
    nordvpn connect US New_York
}

function swvpn() {
    nordvpn disconnect
    nordvpn connect Switzerland
}

alias myip='curl icanhazip.com'