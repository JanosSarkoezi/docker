#!/bin/sh
cd ~/dev/git

if [ -d tmux ]; then
    cd tmux
    git pull
else
    git clone https://github.com/tmux/tmux.git
    cd tmux 
fi

./autogen.sh && ./configure && make && ln -nsf ~/dev/git/tmux/tmux ~/.local/bin/tmux
