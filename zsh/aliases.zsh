alias cp='cp -i'
alias mv='mv -i'
alias df='duf -hide special'
alias ls='eza --icons=auto'
alias ll='eza --icons=auto -lh'
alias la='eza --icons=auto -lah'

alias gdb='gdb -q'
alias myip='curl -s https://iofel.me/ip'
alias isp='curl -s https://ipinfo.io/org'

alias open=open_command
alias ]=open_command

alias gpr='gh pr create -f && gh pr view -w'
alias gv='gh browse'
alias gdm='git diff $(git_main_branch)'
alias utc='TZ=UTC date "+%Y-%m-%dT%H:%M:%S%z"'

alias glow='PAGER=bat glow -p'

tempe () {
  cd "$(mktemp -d)"
  chmod -R 0700 .
  if [[ $# -eq 1 ]]; then
    \mkdir -p "$1"
    cd "$1"
    chmod -R 0700 .
  fi
}

boop () {
  local last="$?"
  if [[ "$last" == '0' ]]; then
    afplay /System/Library/Sounds/Blow.aiff &
  else
    afplay /System/Library/Sounds/Sosumi.aiff &
  fi
  $(exit "$last")
}

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

fix-code-oss() {
    if [ $(uname) = Linux ]; then
        sudo sed -i 's#https://open-vsx.org/vscode/gallery#https://marketplace.visualstudio.com/_apis/public/gallery#; s#https://open-vsx.org/vscode/item#https://marketplace.visualstudio.com/items#' /usr/lib/code/product.json
        echo 'updated /usr/lib/code/product.json'
    else
        echo 'unsupported OS'
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

gaic() {
  if git diff --cached --quiet; then
    gum style --foreground 196 "no staged changes"
    return 1
  fi

  local msg
  msg=$(git diff --cached | llm "########################\ngenerate a concise, one-line commit message") || {
    gum style --foreground 196 "llm failed"
    return 1
  }

  gum style --bold "proposed commit message:"
  echo
  gum style --foreground 212 "$msg"
  echo

  if gum confirm "commit with this message?"; then
    git commit -m "$msg" || {
      gum style --foreground 196 "git commit failed"
      return 1
    }
    gum style --foreground 42 "✓ committed"
  else
    gum style --foreground 196 "aborted"
  fi
}
