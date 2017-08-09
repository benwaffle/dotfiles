# vim: set sw=4 et:
starttime=$(date "+%s.%N")

### plugins

source ~/dotfiles/antigen.zsh

antigen use oh-my-zsh

antigen bundle adb
antigen bundle colored-man-pages
antigen bundle command-not-found
antigen bundle dnf
antigen bundle docker
antigen bundle extract
antigen bundle git
antigen bundle github
antigen bundle sudo

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme robbyrussell

source /etc/profile.d/lesspipe.sh
antigen apply

### end

source /etc/profile.d/autojump.sh
export EDITOR='nvim'
export BROWSER='firefox-developer'
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

#export MALLOC_PERTURB_=$(($RANDOM % 255 + 1))

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

alias df="dfc -d"
alias 4chandl='wget -P pics -H -nd -r -Di.4cdn.org -A ".jpg,.jpeg,.png,.gif," -erobots=off'
alias anonubuntu="docker run -it --rm ubuntu:latest /bin/bash"
alias open=open_command
alias bzrdiff='bzr diff | colordiff | less'
alias yt=youtube
alias vim=nvim
alias dog='pygmentize -g'
alias clip="xsel --clipboard"
alias mv='mv -i'
alias cp='cp -i'

# disable wifi power managment for laptop
alias nopwm='sudo iw dev wlp2s0 set power_save off'

function xdpi {
    xrdb -merge <(echo Xft.dpi: $1)
}

# reload wifi module for desktop
function reloadwifi () {
	sudo rmmod rt2800pci && sudo modprobe rt2800pci
}

function cleanmem () {
	sudo sysctl -w vm.drop_caches=3
	sudo swapoff -a
	sudo swapon -a
}

function usb-status() {
    fmt="%-10s %-54s %-4s %-10s %-10s\n"

    printf "$fmt" "ID" "DEVICE" "AUTO" "RUNTIME" "STATUS"

    for dev in /sys/bus/usb/devices/*; do
        if ! test -e $dev/power/autosuspend; then
            continue
        fi

        { manu=$(< $dev/manufacturer) || manu="(unknown)"
          prod=$(< $dev/product) || prod="${dev#/sys/bus/usb/devices/}"
        } 2> /dev/null

        autosusp=$(< $dev/power/autosuspend)
        rstat=$(< $dev/power/runtime_status)
        renab=$(< $dev/power/runtime_enabled)

        manu=${manu//"$(uname -sr)"/"$(uname -s)"}

        printf "$fmt" "${dev##*/}" "$manu $prod" "$autosusp" "${renab:0:10}" "${rstat:0:10}"
    done
}

transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }

endtime=$(date "+%s.%N")
echo init took $(( ($endtime - $starttime) * 1000 ))ms
