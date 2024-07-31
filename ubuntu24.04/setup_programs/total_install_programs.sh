#!/bin/bash

echo "Start all setup!"
./uninstall_firefox.sh
./install_clang.sh
./install_cmake_ninja.sh
./install_gcc.sh
./install_python.sh
./install_git.sh
./install_terminal.sh
./install_IDE.sh
./install_github_cli.sh
./install_programs.sh
./install_docker.sh
./setup_bashrc.sh

sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/*
