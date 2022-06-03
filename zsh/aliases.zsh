alias cp='cp -i'
alias mv='mv -i'
alias df='duf'
alias ls='exa --git'
alias ll='exa --git -lh'
alias la='exa --git -lah'

alias gdb='gdb -q'
alias myip='curl -s https://iofel.me/ip'
alias isp='curl -s https://ipinfo.io/org'

alias open=open_command
alias ]=open_command

alias gpr='gh pr create -f && gh pr view -w'
alias gv='gh browse'
alias gdm='git diff $(git_main_branch)'
alias utc='TZ=UTC date "+%Y-%m-%dT%H:%M:%S%z"'

em() {
    if [ "$#" -eq 0 ]
    then
        echo "Starting new Emacs process ..." >&2
        open -a Emacs
    elif emacsclient -n "$@" 2> /dev/null
    then
        echo "Opened $@ in Emacs server" >&2
    else
        echo "Opening $@ in a new Emacs process ..." >&2
        open -a Emacs "$@"
    fi
}

fix-vscodium() {
    if [ $(uname) = Linux ]; then
        sudo sed -i 's#https://open-vsx.org/vscode/gallery#https://marketplace.visualstudio.com/_apis/public/gallery#; s#https://open-vsx.org/vscode/item#https://marketplace.visualstudio.com/items#' /opt//vscodium-bin/resources/app/product.json
        echo 'updated /opt/vscodium-bin/resources/app/product.json'
    elif [ $(uname) = Darwin ]; then
        sed -i "" 's#https://open-vsx.org/vscode/gallery#https://marketplace.visualstudio.com/_apis/public/gallery#; s#https://open-vsx.org/vscode/item#https://marketplace.visualstudio.com/items#' /Applications/VSCodium.app/Contents/Resources/app/product.json
        echo 'updated /Applications/VSCodium.app/Contents/Resources/app/product.json'
    else
        echo 'unsupported OS'
    fi
}

dhcp-leases() {
  echo 'show ip dhcp binding; exit' | sshpass -p$ROUTER_PASSWORD ssh admin@192.168.1.1 -oKexAlgorithms=+diffie-hellman-group1-sha1
}
