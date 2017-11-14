export TERM=xterm-256color

# OS判定
if [ "$(uname)" == 'Darwin' ]; then
    OS='mac'
    source $HOME/.dotfiles/.bashrc_macos
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    OS='Linux'
    source $HOME/.dotfiles/.bashrc_linux
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
    OS='Cygwin'
fi

