#!/bin/bash

echo "Start Install programs!"

# Google Chrome
echo "Installing Chrome ..."
wget -nc https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt -y install ./google-chrome-stable_current_amd64.deb
sudo rm -rf ./google-chrome-stable_current_amd64.deb

# Naver Whale
echo "Installing Whale ..."
sudo sh -c 'echo "deb [arch=amd64] http://repo.whale.naver.com/stable/deb stable main" >> /etc/apt/sources.list.d/naver-whale.list'
wget -q -O - http://repo.whale.naver.com/stable/deb/public.gpg | sudo apt-key add -
sudo apt update
sudo apt -y install naver-whale-stable

sudo cp /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d
sudo apt update

# Notion
echo "Installing Notion ..."
sudo snap install notion-snap-reborn --classic

# Slack
echo "Installing Slack ..."
sudo snap install slack --classic

# Teamviewer
echo "Installing Teamviewer ..."
wget -nc https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo apt -y install ./teamviewer_amd64.deb
sudo rm -rf ./teamviewer_amd64.deb

# kolourpaint
echo "Installing kolourpaint ..."
sudo apt-get -y install kolourpaint # kolourpaint

# peek
echo "Installing peek ..."
sudo apt-get -y install peek # peek

# VLC Media
sudo snap install vlc

# Plotjuggler
sudo snap install plotjuggler

# Docker
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

docker --version

sudo usermod -aG docker ${USER}

# Nvidia-docker
sudo systemctl --now enable docker

distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
      && curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
      && curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
            sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
            sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

sudo apt-get -y update

sudo apt-get install -y nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker

