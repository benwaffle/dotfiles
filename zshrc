# vim: set sw=4 et:

### plugins

DISTRO=$(cat /etc/os-release | grep "ID=" | cut -d '=' -f 2)

source ~/dotfiles/antigen.zsh

antigen use oh-my-zsh

antigen bundle adb
[[ $DISTRO = 'arch' ]] && antigen bundle archlinux
antigen bundle autojump
antigen bundle colored-man-pages
antigen bundle command-not-found
antigen bundle docker
antigen bundle extract
antigen bundle git
antigen bundle github
antigen bundle sudo

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme af-magic

antigen apply

### end

export LESSOPEN="|lesspipe.sh %s"
export EDITOR="nvim"
export GREP_COLORS="1;33"

export ANDROID_HOME="$HOME/Android/Sdk"

path+=(
    ~/.npm-global/bin
    ~/.cargo/bin
    ~/.local/bin
    ~/dev/flutter/bin
    ~/Android/Sdk/tools
    ~/Android/Sdk/platform-tools
)
export PATH

alias df="dfc -d"
alias open=open_command
alias dog='pygmentize -g'
alias clip="xsel --clipboard"
alias mv='mv -i'
alias cp='cp -i'
alias gov='sudo cpupower frequency-set -g'
alias gdb='gdb -q'

# disable wifi power managment for laptop
alias nopwm='sudo iw dev wlp2s0 set power_save off'

transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /etc/profile.d/vte.sh

[[ $DISTRO = 'arch' ]] && source /usr/share/doc/pkgfile/command-not-found.zsh
