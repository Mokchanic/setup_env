#!/bin/bash

echo "Installing moveit2 ..."

source /opt/ros/humble/setup.bash

sudo apt-get -y install python3-rosdep

sudo rosdep init
rosdep update
sudo apt-get update
sudo apt-get -y dist-upgrade

## Install Colcon the ROS 2 build system with mixin
sudo apt-get -y install python3-colcon-common-extensions
sudo apt-get -y install python3-colcon-mixin
colcon mixin add default https://raw.githubusercontent.com/colcon/colcon-mixin-repository/master/index.yaml
colcon mixin update default

sudo apt-get install python3-vcstool

## Make moveit2_ws
export MOVEIT_WS=~/ros2_workspace/moveit2_ws
mkdir -p $MOVEIT_WS/src
cd $MOVEIT_WS/src
git clone --branch ${ROS_DISTRO} https://github.com/ros-planning/moveit2_tutorials
vcs import < moveit2_tutorials/moveit2_tutorials.repos

sudo apt-get update && rosdep install -r --from-paths . --ignore-src --rosdistro ${ROS_DISTRO} -y
cd ~/ros2_workspace/moveit2_ws
colcon build --mixin release --parallel-workers 1

## Setup moveit2_ws
source ~/ros2_workspace/moveit2_ws/install/setup.bash
echo 'source ~/ros2_workspace/moveit2_ws/install/local_setup.bash' >> ~/.bashrc
