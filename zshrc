# vim: set sw=4 et:
starttime=$(date "+%s.%N")
ZSH=~/.oh-my-zsh
ZSH_THEME="robbyrussell" # check ~/.oh-my-zsh/themes/ or "random"
DEFAULT_USER="ben"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy" # history

plugins=(
	adb
	archlinux
	composer
	colored-man-pages
	cp
	extract
	git
	github
	laravel5
	sudo
	web-search
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source /usr/share/doc/pkgfile/command-not-found.zsh
source /etc/profile.d/lesspipe.sh

# User configuration

export PATH="$HOME/.npm-global/bin:$HOME/.local/bin:/usr/local/bin:$ANDROID_HOME/platform-tools:$HOME/.gem/ruby/2.4.0/bin/:$PATH"
export EDITOR='nvim'
export BROWSER='firefox-developer'
export GREP_COLORS="1;33"
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

endtime=$(date "+%s.%N")
echo init took $(( ($endtime - $starttime) * 1000 ))ms
