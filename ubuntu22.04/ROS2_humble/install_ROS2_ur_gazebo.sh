#!/bin/bash

echo "Installing UR Gazebo ..."

export UR_GAZEBO_WS=~/ros2_workspace/ur_gazebo_ws
mkdir -p $UR_GAZEBO_WS/src
cd $UR_GAZEBO_WS

sudo apt-get -y install ros-${ROS_DISTRO}-gazebo-ros2-control
# git clone https://github.com/ros-controls/gazebo_ros2_control.git src/

git clone -b ${ROS_DISTRO} https://github.com/UniversalRobots/Universal_Robots_ROS2_Gazebo_Simulation.git src/Universal_Robots_ROS2_Gazebo_Simulation
# vcs import src --input src/Universal_Robots_ROS2_Gazebo_Simulation/Universal_Robots_ROS2_Gazebo_Simulation.${ROS_DISTRO}.repos
rosdep update && rosdep install --ignore-src --from-paths src -y

colcon build --symlink-install
source install/setup.bash
echo 'source ~/ros2_workspace/ur_gazebo_ws/install/local_setup.bash' >> ~/.bashrc
