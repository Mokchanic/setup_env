#!/bin/bash

echo "Installing UR Gazebo ..."

export COLCON_WS=~/workspace/ur_gazebo_ws
mkdir -p $COLCON_WS/src
cd $COLCON_WS

sudo apt -y install ros-humble-gazebo-ros2-control
# git clone https://github.com/ros-controls/gazebo_ros2_control.git src/

git clone -b humble https://github.com/UniversalRobots/Universal_Robots_ROS2_Gazebo_Simulation.git src/Universal_Robots_ROS2_Gazebo_Simulation
# vcs import src --input src/Universal_Robots_ROS2_Gazebo_Simulation/Universal_Robots_ROS2_Gazebo_Simulation.${ROS_DISTRO}.repos
rosdep update && rosdep install --ignore-src --from-paths src -y

colcon build --symlink-install
source install/setup.bash
echo 'source ~/workspace/ur_gazebo_ws/install/local_setup.bash' >> ~/.bashrc
