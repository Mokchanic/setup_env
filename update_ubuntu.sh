#!/bin/bash

# Update & Upgrade
echo "Start Update & Upgrade ..."
sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y autoremove

