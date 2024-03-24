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

