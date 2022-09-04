#!/bin/bash
DIR=$(pwd)

# uninstall older version
sudo apt remove docker docker-engine docker.io containerd runc || true

sudo apt update
sudo apt install ca-certificates curl gnupg lsb-release -y

# Add official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# setup repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# install docker engine
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# post-install setting
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

cd $DIR
