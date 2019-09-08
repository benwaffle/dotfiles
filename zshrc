# vim: set sw=4 et:

### plugins

if [ "$(uname -s)" = Darwin ]; then
    DISTRO=osx
else
    DISTRO=$(grep "ID=" /etc/os-release | cut -d '=' -f 2)
fi

source ~/dotfiles/antigen.zsh

antigen use oh-my-zsh

#antigen bundle adb
[[ $DISTRO = 'arch' ]] && antigen bundle archlinux
antigen bundle autojump
antigen bundle colored-man-pages
#antigen bundle command-not-found
antigen bundle docker
antigen bundle extract
antigen bundle git
antigen bundle github
antigen bundle sudo

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

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

export ANDROID_HOME="$HOME/Android/Sdk"

path+=(
    ~/.cargo/bin
    ~/.local/bin
    ~/dev/flutter/bin
    ~/Android/Sdk/tools
    ~/Android/Sdk/platform-tools
    $GOPATH/bin
    ~/dev/apibuilder-cli/bin
    #/usr/local/opt/curl/bin
)
export PATH

alias df="dfc -d"
alias open=open_command
alias clip="xsel --clipboard"
alias mv='mv -i'
alias cp='cp -i'
alias gov='sudo cpupower frequency-set -g'
alias gdb='gdb -q'

# disable wifi power managment for laptop
alias nopwm='sudo iw dev wlp2s0 set power_save off'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ $DISTRO = 'arch' ]] && source /usr/share/doc/pkgfile/command-not-found.zsh

# macos

. ~/.zsh_private

alias bup='brew update && brew upgrade && brew cask upgrade && brew cleanup'
alias amm='amm --no-remote-logging -b ""'

echo "Reminders:"
echo "- autojump"
echo "- gss"
echo "- alt+h opens man page"
echo "- cd old new"
echo "- alt+t"

[ -f /Users/ben/.travis/travis.sh ] && source /Users/ben/.travis/travis.sh
