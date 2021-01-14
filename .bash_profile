# 共通.bash_profile_common読み込み
source $HOME/.dotfiles/.bash_profile_common

# OS判定
if [ "$(uname)" == 'Darwin' ]; then
    OS='macOS'
    source $HOME/.dotfiles/.bash_profile_macos
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    OS='Linux'
    source $HOME/.dotfiles/.bash_profile_linux
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
    OS='Cygwin'
fi

# Reading .bashrc
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
