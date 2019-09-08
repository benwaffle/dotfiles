export HOMEBREW_NO_ANALYTICS=1
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

alias bup='brew update && brew upgrade && brew cask upgrade && brew cleanup'
alias amm='amm --no-remote-logging -b ""'

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