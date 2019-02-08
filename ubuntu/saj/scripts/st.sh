#!/bin/sh
cd ~/dev/git

if [ -d st ]; then
    cd st
    git pull
else
    git clone git://git.suckless.org/st
    cd st
fi

sed -i 's/char \*termname = "st-256color";/char \*termname = "xterm-256color";/g' config.def.h
make && ln -nsf ~/dev/git/st/st ~/.local/bin/st
