#!/bin/bash

sudo apt -y update && sudo apt install tmux xclip xsel -y

ln -f ../config-files/tmux.conf $HOME/.tmux.conf
ln -f ../config-files/tmux.conf.local $HOME/.tmux.conf.local
