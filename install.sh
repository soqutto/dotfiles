#!/bin/sh

# soqutto/dotfiles Repository
# Install Script

set -eux

install(){
  dotfiles=$HOME/.dotfiles

  has(){
    type "$1" > /dev/null 2>&1
  }

  symlink(){
    if [ -d "$2" ]; then
      ln -sf "$1" "$2"
    elif ! [ -f "$2" ]; then
      ln -sf "$1" "$2"
    fi
  }

  # cloning and unpacking settings
  if [ -d "$dotfiles" ]; then
    (cd "$dotfiles" && git pull --rebase)
  else
    git clone https://github.com/soqutto/dotfiles "$dotfiles"
  fi

  # setup for XDG Base Directory
  mkdir -p $HOME/.config
  mkdir -p $HOME/.cache
  mkdir -p $HOME/.local/share

  # make zsh config directories
  mkdir -p $HOME/.cache/zsh

  # dein.vim install
  mkdir -p $HOME/.cache/dein
  curl -fsSL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh \
  | sh -s -- $HOME/.cache/dein

  # make vim directories
  mkdir -p $HOME/.config/vim
  mkdir -p $HOME/.cache/vim/undo
  mkdir -p $HOME/.cache/vim/swap
  mkdir -p $HOME/.cache/vim/backup

  has git  && symlink "$dotfiles/.gitconfig"      "$HOME/.gitconfig"
  has bash && symlink "$dotfiles/.bash_profile"   "$HOME/.bash_profile"
  has bash && symlink "$dotfiles/.bashrc"         "$HOME/.bashrc"
  has zsh  && symlink "$dotfiles/.zshenv"         "$HOME/.zshenv"
  has zsh  && symlink "$dotfiles/.zshrc"          "$HOME/.zshrc"
  has vim  && symlink "$dotfiles/.vimrc"          "$HOME/.vimrc"
  has vim  && symlink "$dotfiles/.gvimrc"         "$HOME/.gvimrc"

  has vim  && symlink "$dotfiles/template"        "$HOME/.config/vim"

  has tmux && symlink "$dotfiles/.tmux.conf"      "$HOME/.tmux.conf"

}

install
