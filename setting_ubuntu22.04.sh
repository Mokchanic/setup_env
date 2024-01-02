#!/bin/bash

# Update & Upgrade
./update_ubuntu.sh

# Setup vscode
echo "Setup_VSCode..."
cd setup_vscode
./total_vscode_install.sh
