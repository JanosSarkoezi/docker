#!/bin/sh
cd ~/dev/git

if [ -d ripgrep ]; then
    cd ripgrep
    git pull
else
    git clone https://github.com/BurntSushi/ripgrep
    cd ripgrep
fi

~/.cargo/bin/cargo build --release && ln -nsf ~/dev/git/ripgrep/target/release/rg ~/.local/bin/rg
