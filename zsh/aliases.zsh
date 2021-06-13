alias cp='cp -i'
alias mv='mv -i'

if [[ $OS = 'macos' ]]; then
    alias df='dfc'
else
    alias df='duf'
fi

alias ls='exa --git'
alias ll='exa --git -lh'
alias la='exa --git -lah'

alias em='emacsclient -cn'
alias gdb='gdb -q'
alias myip='curl -s https://iofel.me/ip'
alias isp='curl -s https://ipinfo.io | jq -r .org'

alias open=open_command
alias ]=open_command

alias gpr='hub pull-request --browse'
alias gv='gh repo view --web'
alias gdm='git diff $(git_main_branch)'

kpv() {
    kgp -l app=$1 -o json | jq -r '.items | map(.metadata.name + " => " + .metadata.labels["flow.io/version"] + " " + .status.phase) | .[]'
}


fix-vscodium() {
    if [ $(uname) = Linux ]; then
        sudo sed -i 's#https://open-vsx.org/vscode/gallery#https://marketplace.visualstudio.com/_apis/public/gallery#; s#https://open-vsx.org/vscode/item#https://marketplace.visualstudio.com/items#' /usr/share/vscodium-bin/resources/app/product.json
        echo 'updated /usr/share/vscodium-bin/resources/app/product.json'
    elif [ $(uname) = Darwin ]; then
        sed -i 's#https://open-vsx.org/vscode/gallery#https://marketplace.visualstudio.com/_apis/public/gallery#; s#https://open-vsx.org/vscode/item#https://marketplace.visualstudio.com/items#' /Applications/VSCodium.app/Contents/Resources/app/product.json
        echo 'updated /Applications/VSCodium.app/Contents/Resources/app/product.json'
    else
        echo 'unsupported OS'
    fi
}

dhcp-leases() {
  echo 'show ip dhcp binding; exit' | sshpass -p$ROUTER_PASSWORD ssh admin@192.168.1.1 -oKexAlgorithms=+diffie-hellman-group1-sha1
}
