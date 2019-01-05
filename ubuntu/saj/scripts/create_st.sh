cd ~/dev/git
git clone git://git.suckless.org/st
cd st
sed -i 's/char \*termname = "st-256color";/char \*termname = "xterm-256color";/g' config.def.h
make && cp st ~/.local/bin && make clean
