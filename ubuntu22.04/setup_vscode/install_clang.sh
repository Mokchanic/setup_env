#!/bin/bash

# Install Clang
echo "Install Clang"
sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
sudo apt install -y clang

# Verify installed versions
clang --version
