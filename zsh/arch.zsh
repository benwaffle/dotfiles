zi snippet OMZP::archlinux
zi snippet OMZP::command-not-found

alias gov='sudo cpupower frequency-set -g'
alias sys='sudo systemctl'
alias usys='systemctl --user'
alias clip='xsel --clipboard'
alias ip='ip -color'

# disable wifi power managment for laptop
alias nopwm='sudo iw dev wlp2s0 set power_save off'

alias up='yay && flatpak update && fwupdmgr get-updates'

[ -f /etc/profile.d/vte.sh ] && source /etc/profile.d/vte.sh

export USE_CCACHE=1
export CCACHE_COMPRESS=1

# for swaywm
export XKB_DEFAULT_OPTIONS=caps:swapescape
