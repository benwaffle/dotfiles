export HOMEBREW_NO_ANALYTICS=1
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# add GNU sed to path
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

alias -s app='open -a' # open .app files

alias bup='brew update && brew upgrade && brew cask upgrade --greedy && brew cleanup'
alias amm='amm --no-remote-logging -b ""'

[ -f /Users/ben/.travis/travis.sh ] && source /Users/ben/.travis/travis.sh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}