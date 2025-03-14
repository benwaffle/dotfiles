antigen bundle ohmyzsh/ohmyzsh path:plugins/archlinux
antigen bundle ohmyzsh/ohmyzsh path:plugins/command-not-found

alias gov='sudo cpupower frequency-set -g'
alias sys='sudo systemctl'
alias usys='systemctl --user'
alias ip='ip -color'

alias up='yay && flatpak update && fwupdmgr get-updates'

[ -f /etc/profile.d/vte.sh ] && source /etc/profile.d/vte.sh

source /usr/share/doc/git-extras/git-extras-completion.zsh

# for swaywm
#export XKB_DEFAULT_OPTIONS=caps:swapescape
