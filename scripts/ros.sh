#!/bin/bash
DIR=$(pwd)

# update locale
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

# enable Universe repository setting
sudo apt install software-properties-common
sudo add-apt-repository universe

# add ros2 apt repository
sudo apt update && sudo apt install curl gnupg lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

#install ros2
sudo apt upgrade -y && sudo apt update -y
sudo apt install ros-humble-desktop

LINE="source /opt/ros/humble/setup.zsh"
FILE="$HOME/.zshrc"
grep -q "$LINE" "$FILE" || echo "$LINE" >> "$FILE"

cd $DIR

