# vim: set sw=4 et:

### plugins

if [ "$(uname -s)" = Darwin ]; then
    DISTRO=osx
else
    DISTRO=$(grep "^ID=" /etc/os-release | cut -d '=' -f 2)
fi

source ~/dotfiles/antigen.zsh

antigen use oh-my-zsh

#antigen bundle adb
[[ $DISTRO = 'arch' ]] && antigen bundle archlinux
antigen bundle autojump
antigen bundle colored-man-pages
[[ $DISTRO = 'arch' ]] && antigen bundle command-not-found
antigen bundle docker
antigen bundle extract
antigen bundle fzf
antigen bundle git
antigen bundle github
antigen bundle sudo

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

export YSU_MESSAGE_POSITION="after"
antigen bundle MichaelAquilina/zsh-you-should-use

export NVM_LAZY_LOAD=true # lazy load nvm
antigen bundle lukechilds/zsh-nvm

antigen theme af-magic

antigen apply

### end

export LESSOPEN="|lesspipe.sh %s"
export EDITOR="nvim"
export GOPATH=$(go env GOPATH)
export GOBIN=$GOPATH/bin
export GREP_COLORS="1;33"
export HOMEBREW_NO_ANALYTICS=1
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

export ANDROID_HOME="$HOME/Android/Sdk"

path+=(
    ~/.cargo/bin
    ~/.local/bin
    ~/dev/flutter/bin
    ~/Android/Sdk/tools
    ~/Android/Sdk/platform-tools
    ~/.gem/ruby/2.6.0/bin
    $GOPATH/bin
    ~/dev/apibuilder-cli/bin
    #/usr/local/opt/curl/bin
)
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

alias df='dfc -d'
alias open=open_command
alias clip='xsel --clipboard'
alias mv='mv -i'
alias cp='cp -i'
alias gov='sudo cpupower frequency-set -g'
alias gdb='gdb -q'
alias pmb='./pmbootstrap.py --details-to-stdout'
alias sys='sudo systemctl'
alias usys='systemctl --user'
alias emacs='emacsclient -cn'

# disable wifi power managment for laptop
alias nopwm='sudo iw dev wlp2s0 set power_save off'
alias code=vscodium

transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }

if [[ $DISTRO = 'arch' ]]; then
    [ -f /etc/profile.d/vte.sh ] && source /etc/profile.d/vte.sh

    cat <<EOF
Reminders:
- whereis instead of which
- nl prints file with line numbers
EOF

    if [ -n "$DESKTOP_SESSION" ];then
        eval $(gnome-keyring-daemon --start)
        export SSH_AUTH_SOCK
    fi

    function nycvpn {
        nordvpn disconnect
        nordvpn connect US New_York
    }

    function swvpn {
        nordvpn disconnect
        nordvpn connect Switzerland
    }

    alias myip='curl icanhazip.com'
else
    . ~/.zsh_private

    alias bup='brew update && brew upgrade && brew cask upgrade && brew cleanup'
    alias amm='amm --no-remote-logging -b ""'

    echo "Reminders:"
    echo "- autojump"
    echo "- gss"
    echo "- alt+h opens man page"
    echo "- cd old new"
    echo "- alt+t"
    echo "- cmd+shift+o"

    [ -f /Users/ben/.travis/travis.sh ] && source /Users/ben/.travis/travis.sh

    listening() {
        if [ $# -eq 0 ]; then
            sudo lsof -iTCP -sTCP:LISTEN -n -P
        elif [ $# -eq 1 ]; then
            sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
        else
            echo "Usage: listening [pattern]"
        fi
    }
fi
