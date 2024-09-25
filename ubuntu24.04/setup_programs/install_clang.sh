#!/bin/bash

# Install Clang
echo "Install Clang"
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
echo "deb [arch=amd64] http://apt.llvm.org/noble/ llvm-toolchain-noble-18 main" | sudo tee /etc/apt/sources.list.d/llvm.list

sudo apt-get update
sudo apt-get install -y clang

# Verify installed versions
clang --version
