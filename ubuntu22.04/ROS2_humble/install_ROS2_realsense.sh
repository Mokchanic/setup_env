#!/bin/bash

echo "Installing Intel Realsense ..."

# Install SDK
sudo apt-get update
sudo apt-get -y install ros-${ROS_DISTRO}-librealsense2*

# Install Wrapper
export CAMERA_WS=~/ros_workspace/camera_ws
mkdir -p $CAMERA_WS/src
cd $CAMERA_WS

git clone -b ros2-master https://github.com/IntelRealSense/realsense-ros.git src/

sudo rosdep init
rosdep update
rosdep install -i --from-path src --rosdistro ${ROS_DISTRO} --skip-keys=librealsense2 -y

colcon build
source /opt/ros/${ROS_DISTRO}/setup.bash

source install/setup.bash
echo 'source ~/ros_workspace/camera_ws/install/local_setup.bash' >> ~/.bashrc
