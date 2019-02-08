#!/bin/sh
mkdir -p ~/.local/bin
mkdir -p dev/git && cd dev/git
sudo chsh saj --shell $(which zsh)
git clone https://github.com/JanosSarkoezi/dotfiles ~/.dotfiles && cd ~/.dotfiles
git submodule update --init --recursive &&  make install
ln -nsf ~/.profile ~/.zprofile
cp fasd/fasd ~/.local/bin
curl https://sh.rustup.rs -sSf | sh -s -- -y
