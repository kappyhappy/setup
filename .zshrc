# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="candy"

# Which plugins would you like to load?
plugins=(git zsh-syntax-highlighting zsh-completions zsh-autosuggestions)

# zsh-completionsの設定
autoload -U compinit && compinit -u

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

source $ZSH/oh-my-zsh.sh

## goenv settings
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
export GOENV_DISABLE_GOPATH=1
eval "$(goenv init -)"
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

## nodenv settings
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# Example aliases
alias ll="ls -laG"
alias tf="terraform"
alias k="kubectl"
alias v="vim"
alias vi="vim"
alias g='git'
alias gs='git status'
alias gb='git branch'
alias glr='git ls-remote --heads origin'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gg='git grep'
alias ga='git add'
alias gd='git diff'
alias gl='git log'
alias gr='git remote -v'
alias gf='git fetch'
alias gm='git merge'
alias gmom='git merge origin/master'
alias gct='git commit'
alias gcl='git clone'
alias gpoh='git push origin head'

alias d="docker"
alias dc="docker-compose"
alias dcd="docker-compose down"
alias dcud="docker-compose up -d"

alias python="python3"
alias pip="pip3"

alias pr="/usr/local/bin/pr"

alias -g H="|head"
alias -g T="|tail"
alias -g L="|less"
alias -g P="|pbcopy"

# 文字コードの指定
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# ビープ音の停止
setopt no_beep

# ビープ音の停止(補完時)
setopt nolistbeep

# ヒストリ(履歴)を保存、数を増やす
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

