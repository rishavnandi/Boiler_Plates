#!/bin/bash

echo "Updating Cache"
apt update

echo "Installing Docker"
apt install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update
apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin
service docker start

echo "Docker Installed"
echo "Adding User to Docker Group"
usermod -aG docker $USER

echo "User Added to Docker Group"
echo "Installing Docker Compose"
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.11.1/docker-compose-linux-arm64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

echo "Docker Compose Installed"
echo "---Logout And Log Back In Or Reboot The Server---"
echo "Then Run Create_Folder_Structure.sh To Create The Folder Structure"