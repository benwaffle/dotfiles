# vim: set sw=4 et:

export DOTFILES=~/dotfiles

if [ "$(uname -s)" = Darwin ]; then
    OS=macos
else
    OS=$(grep "^ID=" /etc/os-release | cut -d '=' -f 2)
fi

source $DOTFILES/antigen.zsh
antigen use oh-my-zsh

[[ -a ~/.zsh_private ]] && source ~/.zsh_private # secrets that can't go on github should go in this file
[[ -a $DOTFILES/zsh/$OS.zsh ]] && source $DOTFILES/zsh/$OS.zsh # OS-specific config should go in e.g. macos.zsh or arch.zsh

### plugins

antigen bundle autojump
antigen bundle colored-man-pages
antigen bundle docker
antigen bundle extract
antigen bundle fzf
antigen bundle git
antigen bundle github
antigen bundle sudo

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

export YSU_MESSAGE_POSITION="after"
antigen bundle MichaelAquilina/zsh-you-should-use

export NVM_LAZY_LOAD=true # lazy load nvm
antigen bundle lukechilds/zsh-nvm

antigen theme af-magic

antigen apply

### end

export EDITOR='nvim'
export GOPATH=$(go env GOPATH)

path+=(
    ~/.cargo/bin
    ~/.local/bin
    ~/.gem/ruby/2.6.0/bin
    ${GOPATH//://bin:}/bin
    ~/dev/apibuilder-cli/bin
)
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

alias df='dfc -d'
alias open=open_command
alias mv='mv -i'
alias cp='cp -i'
alias gdb='gdb -q'
alias emacs='emacsclient -cn'
alias code=vscodium

transfer() {
    if [ $# -eq 0 ]; then
        echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
        return 1
    fi
    tmpfile=$(mktemp -t transferXXX)
    if tty -s; then
        basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g')
        curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >>$tmpfile
    else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >>$tmpfile; fi
    cat $tmpfile
    rm -f $tmpfile
}

cat <<EOF
Tips:
- whereis instead of which
- autojump (https://github.com/wting/autojump)
- gss
- alt+h opens man page
- cd old new
EOF

if [[ $OS == 'macos' ]]; then

    cat <<EOF
- cmd+shift+o
EOF

fi
