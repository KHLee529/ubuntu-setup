#!/bin/bash
set -e
set -u
set -x

DIR=$(pwd)

sudo apt install zsh tilda -y

# Change default shell to zsh
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s "$(command -v zsh)" "${USER}"

# make directory for zsh related files
zsh_folder="${HOME}/.zsh"
mkdir -p $zsh_folder

# install oh my zsh
echo "n" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ~/.oh-my-zsh/custom/plugins/you-should-use
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

cp ../config-files/zshrc $HOME/.zshrc
mkdir -p $HOME/.config/tilda
ln -f ../config-files/tilda_config_0 $HOME/.config/tilda/config_0

# install autojump manually which is not able to install by apt
cd $zsh_folder
git clone --depth 1 https://github.com/wting/autojump.git
cd autojump && python3 install.py

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
