#!/bin/bash

DIR=$(pwd)

set -e
set -u
set -x
# install vim-gtk for using system clipboard
# see https://vim.fandom.com/wiki/Accessing_the_system_clipboard
sudo apt -y update && sudo apt -y install vim vim-gtk

curl -fLo ~/.vim/autoload/plug.vim --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
ln -f ../config-files/vimrc $HOME/.vimrc
vim +PlugInstall +qall

cd $DIR
