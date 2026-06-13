fpath=(/opt/homebrew/share/zsh/site-functions $fpath)

export HOMEBREW_NO_ANALYTICS=1
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

# make node.js trust mkcert local CA
# export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"

# brew tools + extras (add_path skips dirs that don't exist on this machine)
add_path /opt/homebrew/bin /opt/homebrew/opt/curl/bin /opt/homebrew/opt/python@3/libexec/bin "$HOME/Library/Application Support/Coursier/bin" "$HOME/.lmstudio/bin"

alias -s app='open -a' # run .app files just like executables

alias bup='brew update && brew upgrade && brew upgrade --cask && brew cleanup'

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}

# Used for Ghostty

# [Option-RightArrow] - move forward one word
bindkey -M emacs '^[[1;3C' forward-word
bindkey -M viins '^[[1;3C' forward-word
bindkey -M vicmd '^[[1;3C' forward-word
# [Option-LeftArrow] - move backward one word
bindkey -M emacs '^[[1;3D' backward-word
bindkey -M viins '^[[1;3D' backward-word
bindkey -M vicmd '^[[1;3D' backward-word
# [CMD-Left] - move to start
bindkey -M emacs "^[[1;9D" beginning-of-line
bindkey -M viins "^[[1;9D" beginning-of-line
bindkey -M vicmd "^[[1;9D" beginning-of-line
# [CMD-Right] - move to end
bindkey -M emacs "^[[1;9C" end-of-line
bindkey -M viins "^[[1;9C" end-of-line
bindkey -M vicmd "^[[1;9C" end-of-line
