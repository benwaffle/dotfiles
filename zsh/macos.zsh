export HOMEBREW_NO_ANALYTICS=1
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

zi wait pack for brew-completions

# add GNU sed to path
export PATH="/opt/homebrew/opt/python@3/libexec/bin:/Users/ben/Library/Application Support/Coursier/bin:$PATH"

alias -s app='open -a' # run .app files just like executables

alias bup='brew update && brew upgrade && brew upgrade --cask && brew cleanup'

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

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

# Used for GhosTTY

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
