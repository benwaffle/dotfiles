export HOMEBREW_NO_ANALYTICS=1
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

# make node.js trust mkcert local CA
export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"

# add curl and GNU sed to path
export PATH="/opt/homebrew/opt/curl/bin:/opt/homebrew/opt/python@3/libexec/bin:/Users/ben/Library/Application Support/Coursier/bin:$PATH"
export PATH="$PATH:/Users/ben/.lmstudio/bin"

alias -s app='open -a' # run .app files just like executables

alias bup='brew update && brew upgrade && brew upgrade --cask && brew cleanup'

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

[ -e ~/.iterm2_shell_integration.zsh ] && . ~/.iterm2_shell_integration.zsh

# pnpm
export PNPM_HOME="/Users/ben/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

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
