#!/bin/bash

# Update & Upgrade
./update_ubuntu.sh

# Setup ubuntu
echo "Setup Ubuntu 22.04 ..."
cd ubuntu22.04/setup_programs
./setup_bashrc.sh

cd .. && cd ROS2_humble
./install_ROS2_humble_full.sh
./install_ROS2_moveit2.sh
./install_ROS2_ur_gazebo.sh
./install_ROS2_ur_manipulator.sh

echo "Now reboot system to apply changes"
