#!/bin/bash

DIR=$(pwd)

execute sudo apt install zsh -y

# Change default shell to zsh
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s "$(command -v zsh)" "${USER}"

# make directory for zsh related files
zsh_folder="${HOME}/.zsh"
mkdir -p $zsh_folder

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install autojump manually which is not able to install by apt
cd $zsh_folder
git clone --depth 1 git://github.com/wting/autojump.git
cd autojump && ./install.py

cp ../config_files/zshrc $HOME/.zshrc
mkdir -p $HOME/.config/tilda
ln -f ../config_files/tilda_config_0 $HOME/.config/tilda/config_0

# Create bash aliases
# ln -f ./config_files/bash_aliases /opt/.zsh/bash_aliases # Suppress error messages in case the file already exists
# rm -f ~/.bash_aliases
# ln -s /opt/.zsh/bash_aliases ~/.bash_aliases
# 
# {
#     echo "if [ -f ~/.bash_aliases ]; then"
#     echo "  source ~/.bash_aliases"
#     echo "fi"
# 
#     echo "# Switching to 256-bit colour by default so that zsh-autosuggestion's suggestions are not suggested in white, but in grey instead"
#     echo "export TERM=xterm-256color"
# } >> ~/.zshrc

cd $DIR
