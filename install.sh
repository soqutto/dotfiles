#!/bin/sh

# soqutto/dotfiles Repository
# Install Script

set -eu

install(){
    dotfiles=$HOME/.dotfiles

    has(){
        type "$1" > /dev/null 2>&1
    }

    symlink(){
        [ -e "$2" ] || ln -si "$1" "$2"
    }

    if [ -d "$dotfiles" ]; then
        (cd "$dotfiles" && git pull --rebase)
    else
        git clone https://github.com/soqutto/dotfiles "$dotfiles"
    fi

    has git  && symlink "$dotfiles/.gitconfig"      "$HOME/.gitconfig"
    has vim  && symlink "$dotfiles/.vimrc"          "$HOME/.vimrc"
    has vim  && symlink "$dotfiles/.gvimrc"         "$HOME/.gvimrc"
    has vim  && symlink "$dotfiles/template"        "$HOME/.vim"
    has bash && symlink "$dotfiles/.bash_profile"   "$HOME/.bash_profile"
    has bash && symlink "$dotfiles/.bashrc"         "$HOME/.bashrc"

}

install
