alias cp='cp -i'
alias df='dfc -d'
alias mv='mv -i'

alias ls='exa --git'
alias ll='exa --git -lh'
alias la='exa --git -lah'

alias emacs='emacsclient -cn'
alias gdb='gdb -q'
alias myip='curl -s https://iofel.me/ip'
alias isp='curl -s https://ipinfo.io | jq -r .org'

alias open=open_command
alias ]=open_command

alias gpr='hub pull-request --browse'
alias gv='gh repo view --web'

kpv() {
    kgp -l app=$1 -o json | jq -r '.items | map(.metadata.name + " => " +  .metadata.labels["flow.io/version"]) | .[]'
}


fix-vscodium() {
    if [ $(uname) = Linux ]; then
        sudo sed -i 's#https://open-vsx.org/vscode/gallery#https://marketplace.visualstudio.com/_apis/public/gallery#; s#https://open-vsx.org/vscode/item#https://marketplace.visualstudio.com/items#'  /usr/share/vscodium-bin/resources/app/product.json
        echo 'updated /usr/share/vscodium-bin/resources/app/product.json'
    else
        echo unsupported OS
    fi
}
