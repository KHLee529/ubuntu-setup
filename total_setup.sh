#!/bin/bash

set -e
set -u
set -x

DIR=$(pwd)

# run required scripts in `scripts`
cd scripts
bash setup.sh
bash git.sh
bash vim.sh
bash zsh.sh
bash tmux.sh
bash docker.sh
bash ros.sh

cd $DIR
