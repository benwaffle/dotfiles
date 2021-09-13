# vim: set sw=4 et:

export DOTFILES=~/dotfiles

if [ "$(uname -s)" = Darwin ]; then
    OS=macos
else
    OS=$(grep "^ID=" /etc/os-release | cut -d '=' -f 2)
fi

source $DOTFILES/zsh/antigen.zsh
antigen use oh-my-zsh

[[ -a ~/.zsh_private ]] && source ~/.zsh_private # secrets that can't go on github should go in this file
[[ -a $DOTFILES/zsh/$OS.zsh ]] && source $DOTFILES/zsh/$OS.zsh # OS-specific config should go in e.g. macos.zsh or arch.zsh

### plugins

antigen bundle colored-man-pages
antigen bundle docker
antigen bundle extract
antigen bundle kubectl
antigen bundle fasd
antigen bundle fzf
antigen bundle git
antigen bundle github
antigen bundle sudo

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zdharma/fast-syntax-highlighting

export YSU_MESSAGE_POSITION="after"
antigen bundle MichaelAquilina/zsh-you-should-use

export NVM_LAZY_LOAD=true # lazy load nvm
antigen bundle lukechilds/zsh-nvm

antigen apply

### end

source $DOTFILES/zsh/aliases.zsh

export EDITOR='nvim'
export GOPATH=$(go env GOPATH)
export GOBIN="${GOPATH//://bin:}/bin"

path=(
    ~/.cargo/bin
    ~/.local/bin
    $GOBIN
    ~/.gem/ruby/2.6.0/bin
    ~/dev/apibuilder-cli/bin
    /usr/local/sbin
    ~/.krew/bin
    $path
)
export PATH

export RIPGREP_CONFIG_PATH=~/dotfiles/ripgreprc

export STARSHIP_CONFIG=~/dotfiles/starship.toml
eval "$(starship init zsh)"

cat <<EOF
Tips:
- fasd (https://github.com/clvv/fasd)
- gsb
- alt+h opens man page
- !$ last arg
EOF
