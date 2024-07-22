#!/bin/bash

echo "Installing IFRA ..."

sudo apt update && sudo apt -y upgrade

source opt/ros/humble/setup.bash
sudo apt -y install ros-humble-moveit

source ~/robot_ws/install/local_setup.bash

# ROS2 Control + ROS2 Controllers:
sudo apt -y install ros-humble-ros2-control
sudo apt -y install ros-humble-ros2-controllers
sudo apt -y install ros-humble-gripper-controllers


# Gazebo for ROS2 Humble:
sudo apt -y install gazebo
sudo apt -y install ros-humble-gazebo-ros2-control
sudo apt -y install ros-humble-gazebo-ros-pkgs

# xacro:
sudo apt install ros-humble-xacro

cd ~/robot_ws/src
mkdir ABBDriver && cd ABBDriver
git clone https://github.com/PickNikRobotics/abb_ros2.git -b rolling
sudo rosdep init
rosdep update
vcs import < abb_ros2/abb.repos
rosdep install -r --from-paths . --ignore-src --rosdistro $ROS_DISTRO -y
cd ~/robot_ws
colcon build

sudo -y apt-get install ros-humble-ur-robot-driver

cd ~/robot_ws/src
git clone https://github.com/IFRA-Cranfield/IFRA_LinkAttacher.git
git clone https://github.com/IFRA-Cranfield/ros2_SimRealRobotControl
cd ~/robot_ws
colcon build
