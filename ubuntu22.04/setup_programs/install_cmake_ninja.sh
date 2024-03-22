#!/bin/bash

# Install CMake
echo "Installing CMake ..."
sudo apt-get install -y cmake

# Verify installed versions
cmake --version

#Install Ninja
echo "Installing Ninja ..."
sudo apt-get install -y ninja-build

# Verify installed versions
ninja --version

