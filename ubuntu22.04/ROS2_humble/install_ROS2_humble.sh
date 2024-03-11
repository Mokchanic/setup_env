#!/bin/bash

# Check locale
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

# Enable Ubuntu Universe repository
sudo apt install software-properties-common
sudo add-apt-repository universe

# add GPG key
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

# add repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Update & Upgrade
sudo apt update && sudo apt upgrade -y

# Install ROS2-humble
echo "Install ROS2-humble-desktop!"
sudo apt install ros-humble-desktop -y

# Set_env
source /opt/ros/humble/setup.bash

# Install colcon
sudo apt install python3-colcon-common-extensions -y
