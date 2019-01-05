mkdir -p ~/.local/bin
mkdir -p dev/git && cd dev/git
sudo chsh saj --shell $(which zsh)
git clone https://github.com/JanosSarkoezi/dotfiles ~/.dotfiles && cd ~/.dotfiles
git submodule update --init --recursive &&  make install
cp fasd/fasd ~/.local/bin
vim +PlugInstall +qall!
