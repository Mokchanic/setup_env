#!/bin/bash

echo "Installing UR Manipulator ..."

sudo apt-get -y install ros-${ROS_DISTRO}-ur
sudo apt-get -y install ros-${ROS_DISTRO}-ur-robot-driver
sudo apt -y install python3-colcon-common-extensions python3-vcstool

# Make workspace
export COLCON_WS=~/workspace/ros_ur_driver
mkdir -p $COLCON_WS/src

git clone https://github.com/UniversalRobots/Universal_Robots_ROS2_Driver.git src/Universal_Robots_ROS2_Driver
vcs import src --skip-existing --input src/Universal_Robots_ROS2_Driver/Universal_Robots_ROS2_Driver.${ROS_DISTRO}.repos

rosdep install --ignore-src --from-paths src -y
colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release
source install/setup.bash

sudo apt -y install ros-humble-gazebo-ros2-control

git clone https://github.com/UniversalRobots/Universal_Robots_ROS2_Gazebo_Simulation.git src/Universal_Robots_ROS2_Gazebo_Simulation
vcs import src --input src/Universal_Robots_ROS2_Gazebo_Simulation/Universal_Robots_ROS2_Gazebo_Simulation.${ROS_DISTRO}.repos
rosdep install --ignore-src --from-paths src -y

colcon build
source install/setup.bash

