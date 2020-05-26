export HOMEBREW_NO_ANALYTICS=1
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

export JAVA_HOME=$(/usr/libexec/java_home -v 14)

# add GNU sed to path
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

alias -s app='open -a' # run .app files just like executables

alias bup='brew update && brew upgrade && brew cask upgrade --greedy && brew cleanup'
alias amm='amm --no-remote-logging -b ""'

[ -e ~/.travis/travis.sh ] && . ~/.travis/travis.sh

[ -e ~/.iterm2_shell_integration.zsh ] && . ~/.iterm2_shell_integration.zsh

[ -e ~/.nix-profile/etc/profile.d/nix.sh ] && . ~/.nix-profile/etc/profile.d/nix.sh

listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}