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
        [ -e "$2" ] || ln -sf "$1" "$2"
    }

    symlink_dir(){
        [ -e "$2" ] || ln -sf "$1" "$2"
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

    # dein.vim install
    mkdir -p $HOME/.vim/dein
    curl -fsSL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh \
    | sh -s -- $HOME/.vim/dein

    # make vim temporary directories
    mkdir -p $HOME/.cache/vim/undo
    mkdir -p $HOME/.cache/vim/swap

    has git  && symlink "$dotfiles/.gitconfig"      "$HOME/.gitconfig"
    has bash && symlink "$dotfiles/.bash_profile"   "$HOME/.bash_profile"
    has bash && symlink "$dotfiles/.bashrc"         "$HOME/.bashrc"
    has vim  && symlink "$dotfiles/.vimrc"          "$HOME/.vimrc"
    has vim  && symlink "$dotfiles/.gvimrc"         "$HOME/.gvimrc"

    has vim  && symlink_dir "$dotfiles/template"        "$HOME/.vim"

}

install
