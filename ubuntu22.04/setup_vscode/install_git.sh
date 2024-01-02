#!/bin/bash

# Dependency
./install_curl.sh

# Install Git
echo "Install Git"
sudo apt install -y git

# Verify installed versions
git --version
