#!/bin/bash

# Update & Upgrade
./update_ubuntu.sh

# Setup ubuntu
echo "Setup Ubuntu ..."
cd ubuntu22.04/setup_programs
./total_install_programs.sh

echo "Now reboot system to apply changes"

