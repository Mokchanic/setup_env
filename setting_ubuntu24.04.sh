#!/bin/bash

# Update & Upgrade
./update_ubuntu.sh

# Setup ubuntu
echo "Setup Ubuntu 24.04 ..."
cd ubuntu24.04/setup_programs
./total_install_programs.sh

echo "Now reboot system to apply changes"

