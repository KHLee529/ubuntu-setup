# /bin/bash
set -e
set -x
set -u

sudo apt update && sudo apt install -y vim git colordiff

ln ../config-files/gitconfig $HOME/.gitconfig
