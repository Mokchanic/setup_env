#!/bin/bash

echo "Installing UR Manipulator ..."

# sudo apt-get -y install ros-${ROS_DISTRO}-ur
# sudo apt-get -y install ros-${ROS_DISTRO}-ur-robot-driver
sudo apt -y install python3-colcon-common-extensions python3-vcstool

# Make workspace
export UR_WS=~/ros_workspace/ur_ws
mkdir -p $UR_WS/src
cd $UR_WS

git clone -b humble https://github.com/UniversalRobots/Universal_Robots_ROS2_Driver.git src/Universal_Robots_ROS2_Driver
vcs import src --skip-existing --input src/Universal_Robots_ROS2_Driver/Universal_Robots_ROS2_Driver.${ROS_DISTRO}.repos

rosdep init
rosdep update
rosdep install --ignore-src --from-paths src -y
colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release

source install/setup.bash
echo 'source ~/ros_workspace/ur_ws/install/local_setup.bash' >> ~/.bashrc
