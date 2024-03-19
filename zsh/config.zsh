# vim: set sw=4 et:

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ "$(uname -s)" = Darwin ]; then
    OS=macos
else
    OS=$(grep "^ID=" /etc/os-release | cut -d '=' -f 2)
fi

# $ZSH_CACHE_DIR is expected by the kubectl snippet
export ZSH_CACHE_DIR=$HOME/.cache/zi/

zi_home="${HOME}/.zi"
source "${zi_home}/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

zi snippet OMZL::clipboard.zsh
zi snippet OMZL::compfix.zsh
zi snippet OMZL::completion.zsh
zi snippet OMZL::correction.zsh
zi snippet OMZL::directories.zsh
zi snippet OMZL::functions.zsh
zi snippet OMZL::git.zsh
zi snippet OMZL::grep.zsh
zi snippet OMZL::history.zsh
zi snippet OMZL::key-bindings.zsh
zi snippet OMZL::misc.zsh
zi snippet OMZL::termsupport.zsh
zi snippet OMZL::theme-and-appearance.zsh
zi snippet OMZL::vcs_info.zsh

[[ -a ~/.zsh_private ]] && source ~/.zsh_private # secrets that can't go on github should go in this file
[[ -a ~/dotfiles/zsh/$OS.zsh ]] && source ~/dotfiles/zsh/$OS.zsh # OS-specific config should go in e.g. macos.zsh or arch.zsh

### plugins

zi snippet OMZP::asdf
fpath=(${ASDF_DIR}/completions $fpath)

zi snippet OMZP::1password
zi snippet OMZP::colored-man-pages
zi snippet OMZP::extract
zi snippet OMZP::fzf
zi snippet OMZP::git
zi snippet OMZP::github
zi snippet OMZP::kubectl
zi snippet OMZP::sudo
zi snippet OMZP::terraform

zi load zsh-users/zsh-autosuggestions
zi load z-shell/F-Sy-H

export YSU_MESSAGE_POSITION="after"
zi load MichaelAquilina/zsh-you-should-use

export NVM_LAZY_LOAD=true # lazy load nvm
zi light lukechilds/zsh-nvm

autoload -Uz compinit && compinit

zi cdreplay -q

HISTSIZE=999999999
SAVEHIST=$HISTSIZE

eval "$(zoxide init --cmd j zsh)" # the default of "zi" is already used

### end

source ~/dotfiles/zsh/aliases.zsh

export EDITOR='nvim'

path=(
    ~/.cargo/bin
    ~/.local/bin
    ~/.fly/bin
    ~/go/bin
    ~/.gem/ruby/2.6.0/bin
    /usr/local/sbin
    $path
)
export PATH

export LESS=-RXF

export RIPGREP_CONFIG_PATH=~/dotfiles/ripgreprc

zi depth=1 for romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(direnv hook zsh)"
