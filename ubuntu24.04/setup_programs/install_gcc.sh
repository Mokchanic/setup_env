#!/bin/bash

# Dependency
./install_build-essential.sh

# Install gcc
echo "Install gcc"
sudo apt-get install -y gcc

# Verify installed versions
gcc --version
