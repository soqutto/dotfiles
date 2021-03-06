# The following lines were added by compinstall
zstyle :compinstall filename '/Users/soqutto/.zshrc'

# 色を使用可能にする
autoload -Uz colors
colors

# プロンプトの設定
export PS1="%{$fg[magenta]%}%n@%m:%{$fg[blue]%}%1~ %{$fg[red]%}%(!,#,$) %{$reset_color%}"
export PS2="%{$fg[red]%}> %{$reset_color%}"

# コマンド履歴の設定
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000

# 補完の設定
autoload -Uz compinit
compinit

# キーバインドの設定
bindkey -v

# エイリアスの設定
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'

alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# EDITOR, PAGER settings
export EDITOR=vim
export PAGER=less

# anyenv setting
eval "$(anyenv init -)"

#
export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:$HOME/src/ac-library"

