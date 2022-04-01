export HOMEBREW_NO_ANALYTICS=1
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

unset JAVA_HOME
export JAVA_HOME=$(/usr/libexec/java_home -v 14)

# add GNU sed to path
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

alias -s app='open -a' # run .app files just like executables

alias bup='brew update && brew upgrade && brew upgrade --cask && brew cleanup'
#alias stern='stern --exclude-container=istio-proxy --exclude _internal_/healthcheck'
alias logs='stern --exclude _internal_/healthcheck --tail 50'
alias nodes="kgno -L 'role,node.kubernetes.io/instance-type,topology.kubernetes.io/zone'"

hc() {
    echo https://$1.api.flow.io/_internal_/healthcheck
    curl -v https://$1.api.flow.io/_internal_/healthcheck
}

kpv() {
    kgpl app=$1 -n production -L flow.io/version
}

# [ -e ~/.travis/travis.sh ] && . ~/.travis/travis.sh

[ -e ~/.iterm2_shell_integration.zsh ] && . ~/.iterm2_shell_integration.zsh

# [ -e ~/.nix-profile/etc/profile.d/nix.sh ] && . ~/.nix-profile/etc/profile.d/nix.sh

listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}
