#!/bin/bash

sudo apt -y update && sudo apt install tmux xclip xsel -y

ln ../config-files/tmux.conf $HOME/.tmux.conf
ln ../config-files/tmux.conf.local $HOME/.tmux.conf.local
