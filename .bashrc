export TERM=xterm-256color

# OS判定
if [ $(uname) == 'Darwin' ]; then
	OS = 'mac'
	source $HOME/.bashrc_macos
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
	OS = 'Linux'
	source $HOME/.bashrc_linux
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
	OS = 'Cygwin'
fi

export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '

alias ls='ls -F --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -laF --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias df='df -h'

alias ps='ps --sort=start_time'

