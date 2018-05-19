#!/bin/bash -ex

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "alias vim='nvim'" >> ~/.bashrc
mkdir -p ~/.config/nvim
cp ./init.vim ~/.config/nvim/init.vim
cp ./.tmux.conf ~/.tmux.conf

# for python env
#virtualenv -p /usr/bin/python3 ~/ENV
# install pylint for vim-syntastic to work in virtualenv
#. ~/ENV/bin/activate && pip3 install pylint

# for deoplete to work
#pip3 install neovim

nvim +PlugInstall +qall
