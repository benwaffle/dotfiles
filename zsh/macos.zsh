export HOMEBREW_NO_ANALYTICS=1
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
export GOPRIVATE=github.com/flowcommerce

eval $(coursier java --env --jvm zulu:13)

# add GNU sed to path
export PATH="/opt/homebrew/opt/python@3/libexec/bin:/Users/ben/Library/Application Support/Coursier/bin:$PATH"

alias -s app='open -a' # run .app files just like executables

alias bup='brew update && brew upgrade && brew upgrade --cask && brew cleanup'
#alias stern='stern --exclude-container=istio-proxy --exclude _internal_/healthcheck'
alias logs='stern --exclude _internal_/healthcheck --tail 50'
alias nodes="kgno -L 'role,node.kubernetes.io/instance-type,topology.kubernetes.io/zone' --sort-by '{.metadata.creationTimestamp}'"

alias helm3=/opt/homebrew/opt/helm@3/bin/helm
alias helm2=/opt/homebrew/opt/helm@2/bin/helm
alias helm='echo specify helm2 or helm3 #'

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

alias nvim=neovide

hc() {
    echo https://$1.api.flow.io/_internal_/healthcheck
    curl -v https://$1.api.flow.io/_internal_/healthcheck
}

kpv() {
    kubectl get pods -l app=$1 -n production -L flow.io/version
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
