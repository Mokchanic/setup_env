#!/bin/bash

# Update & Upgrade
./update_ubuntu.sh

# Setup vscode
echo "Setup_VSCode..."
cd ubuntu22.04/setup_vscode
./total_vscode_install.sh
