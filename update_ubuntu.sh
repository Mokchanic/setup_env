#!/bin/bash

# Update & Upgrade
echo "Start Update & Upgrade ..."
sudo apt update -y && sudo apt upgrade -y
sudo apt autoremove -y
