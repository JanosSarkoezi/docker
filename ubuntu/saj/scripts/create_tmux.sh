cd ~/dev/git
git clone https://github.com/tmux/tmux.git
cd tmux && ./autogen.sh && ./configure && make && cp tmux ~/.local/bin && make clean
