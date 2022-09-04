#!/bin/bash

DIR=$(pwd)

set -e
set -u
set -x

sudo apt -y update && sudo apt -y install vim 

curl -fLo ~/.vim/autoload/plug.vim --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
ln -f ../config-files/vimrc $HOME/.vimrc
vim -c "PlugInstall"

cd $DIR
