#!/bin/bash
DIR=$(pwd)

# update locale
sudo apt update && sudo apt install locales -y
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

# install Gazebo
curl -sSL http://get.gazebosim.org | sh

# enable Universe repository setting
sudo apt install software-properties-common -y
sudo add-apt-repository universe

# add ros2 apt repository
sudo apt update && sudo apt install curl gnupg lsb-release -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

#install ros2
sudo apt upgrade -y && sudo apt update -y
sudo apt install ros-humble-desktop -y

LINE="source /opt/ros/humble/setup.zsh"
FILE="$HOME/.zshrc"
grep -q "$LINE" "$FILE" || echo "$LINE" >> "$FILE"

# install colcon for building ros package
sudo apt install python3-colcon-common-extensions -y

cd $DIR

