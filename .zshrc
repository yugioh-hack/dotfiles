# commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
# if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# fi


export TERM=xterm-256color
# Customize to your needs...
export LANG=ja_JP.UTF-8
# export PYENV_ROOT="${HOME}/.pyenv"
# export PATH=${PYENV_ROOT}/bin:$PATH
# eval "$(pyenv init -)"
PATH="/usr/local/bin:${PATH}"
export PATH="usr/local/bin:$PATH"
export PATH="usr/bin:$PATH"
# export PATH=/usr/local/bin
export PATH=$HOME/.nodebrew/current/bin:$PATH
# export NODEBREW_ROOT=/usr/local/var/nodebrew
# export PATH=$NODEBREW_ROOT/current/bin:$PATH
# export PATH="/usr/bin:$PATH"
# export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
export PATH="/usr/local:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/Cellar:$PATH"
export PATH="/usr/local/gcc-arm-none-eabi-5_4-2016q2/bin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/texlive/2018/bin/x86_64-linux:$PATH"
export INFOPATH="/usr/local/texlive/2018/texmf-dist/doc/info"
export MANPATH="/usr/local/texlive/2018/texmf-dist/doc/man:$MANPATH"
#export PATH="/usr/local/texlive/2016/bin/x86_64-darwin:$PATH"
export PATH="/dev:$PATH"
export PATH="$PATH:/usr/local/python/bin"
export fpath=(/usr/local/share/zsh-completions $fpath)
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH=/usr/local/opt/openssl/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/opt/openssl/lib:$LD_LIBRARY_PATH
export CPATH=/usr/local/opt/openssl/include:$LD_LIBRARY_PATH
# source ~/perl5/etc/zshrc
# export PATH= "$PATH:/usr/.nodebrew/current/bin"
# export PATH= "$PATH:/usr/local/bin:/usr/bin"
# export PATH= "$PATH:/usr/local/gcc-arm-none-eabi-4_8-2014q3/bin"
# export PATH= "$PATH:/usr/local/texlive/2016/bin/x86_64-darwin/"
# export PATH= "$PATH:/usr/local/opt/gnu-tar/libexec/gnubin"
# export PATH= "$PATH:/usr/local/gcc-arm-none-eabi-5_4-2016q2/bin"
# export MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman:$MANPATH"
# export HOMEBREW_CASK_OPTS="--appdir=/Applications"
# User configuration
# if [ -d $HOME/tools ]
# then
#     PATH=$PATH:$HOME/tools; export PATH
# fi
# カラーを使用
autoload -Uz colors
colors

# rbenvの設定
# eval "$(rbenv init -)"
# 補完
autoload -Uz compinit
compinit -U

## 重複パスを登録しない
typeset -U path cdpath fpath manpath

# 他のターミナルとヒストリーを共有
setopt share_history

# ヒストリーに重複を表示しない
setopt histignorealldups

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# cdコマンドを省略して、ディレクトリ名のみの入力で移動
setopt auto_cd

# 自動でpushdを実行
setopt auto_pushd

# pushdから重複を削除
setopt pushd_ignore_dups

# コマンドミスを修正
setopt correct

# グローバルエイリアス
alias -g L='| less'
alias -g H='| head'
alias -g G='| grep'
alias -g GI='| grep -ri'


# エイリアス
alias ls='ls -G'
# alias lst='ls -ltr --color=auto'
alias l='ls -ltr --color=auto'
alias la='ls -la --color=auto'
alias ll='ls -l --color=auto'
alias so='source'
alias v='vim'
alias vi='vim'
alias vz='vim ~/.zshrc'
alias c='cdr'
# historyに日付を表示
alias h='fc -lt '%F %T' 1'
alias cp='cp -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias ..='c ../'
alias back='pushd'
alias diff='diff -U1'

# backspace,deleteキーを使えるように
# stty erase ^H
# bindkey "^[[3~" delete-char

# cdの後にlsを実行
chpwd() { ls -ltr --color=auto }

# どこからでも参照できるディレクトリパス
cdpath=(~)

# 区切り文字の設定
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars "_-./;@"
zstyle ':zle:*' word-style unspecified

# Ctrl+sのロック, Ctrl+qのロック解除を無効にする
setopt no_flow_control

# プロンプトを2行で表示、時刻を表示
# PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color}@${fg[green]}%m${reset_color}(%*%) %~
#

local prompt_location="%{${fg[cyan]}%}[%~]"
local prompt_username="%{${fg[white]}%}%n:"
local promot_mark="%n%B%(?,%F{magenta},%F{red})%(!,#,❯)%b"

PROMPT='
${prompt_location}
${prompt_username}${prompt_mark}'

# 補完後、メニュー選択モードになり左右キーで移動が出来る
zstyle ':completion:*:default' menu select=2

# 補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Ctrl+rでヒストリーのインクリメンタルサーチ、Ctrl+sで逆順
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward

# コマンドを途中まで入力後、historyから絞り込み
# 例 ls まで打ってCtrl+pでlsコマンドをさかのぼる、Ctrl+bで逆順
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^b" history-beginning-search-forward-end

# cdrコマンドを有効 ログアウトしても有効なディレクトリ履歴
# cdr タブでリストを表示
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs
# cdrコマンドで履歴にないディレクトリにも移動可能に
zstyle ":chpwd:*" recent-dirs-default true

# 複数ファイルのmv 例　zmv *.txt *.txt.bk
autoload -Uz zmv
alias zmv='noglob zmv -W'

# mkdirとcdを同時実行
function mkcd() {
  if [[ -d $1 ]]; then
    echo "$1 already exists!"
    cd $1
  else
    mkdir -p $1 && cd $1
  fi
}

# git設定
RPROMPT="%{${fg[cyan]}%}[%*]%{${reset_color}%}"
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'
#----- pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
