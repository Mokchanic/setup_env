#!/bin/bash

# Set locale
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

# Enable Ubuntu Universe repository
sudo apt -y install  software-properties-common
sudo add-apt-repository universe

# add GPG key
sudo apt update && sudo apt -y install curl
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

# add repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Update & Upgrade
sudo apt update && sudo apt upgrade

# Install ROS2-humble
echo "Install ROS2-humble-desktop!"
sudo apt -y install ros-humble-desktop-full

# Set_env
source /opt/ros/humble/setup.bash

# Install colcon
sudo apt -y install python3-colcon-common-extensions

# Install ros-tools
sudo apt update && sudo apt -y install \
  ros-dev-tools\
  libbullet-dev \
  python3-flake8 \
  python3-pip \
  python3-pytest-cov \
  python3-rosdep \
  python3-setuptools \
  python3-vcstool \
  wget

python3 -m pip install -U \
  argcomplete \
  flake8-blind-except \
  flake8-builtins \
  flake8-class-newline \
  flake8-comprehensions \
  flake8-deprecated \
  flake8-docstrings \
  flake8-import-order \
  flake8-quotes \
  pytest-repeat \
  pytest-rerunfailures \
  pytest

## Make base ROS2_ws
source /opt/ros/humble/setup.bash
export ROBOT_WS=~/ros_workspace/robot_ws
mkdir -p $ROBOT_WS/src
cd $ROBOT_WS
colcon build --symlink-install

## rosdep init
sudo rosdep init
rosdep update

# Cyclone DDS
sudo apt -y install ros-${ROS_DISTRO}-rmw-cyclonedds-cpp

## Setup Cyclone DDS
# cd ~/robot_ws/src
# git clone https://github.com/ros2/rmw_cyclonedds ros2/rmw_cyclonedds -b humble
# git clone https://github.com/eclipse-cyclonedds/cyclonedds eclipse-cyclonedds/cyclonedds
# cd ..
# rosdep -y install --from src -i
# colcon build --symlink-install
# export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

# ## Setup ROS2
echo "## Setup ROS2" >> ~/.bashrc
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
echo "source ~/ros_workspace/robot_ws/install/local_setup.bash" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> ~/.bashrc
echo "source /usr/share/vcstool-completion/vcs.bash" >> ~/.bashrc
echo "source /usr/share/colcon_cd/function/colcon_cd.sh" >> ~/.bashrc
echo "export _colcon_cd_root=~/ros_workspace/robot_ws" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "export ROS_DOMAIN_ID=17" >> ~/.bashrc
echo "export ROS_NAMESPACE=robot1" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "# export RMW_IMPLEMENTATION=rmw_fastrtps_cpp" >> ~/.bashrc
echo "# export RMW_IMPLEMENTATION=rmw_connext_cpp" >> ~/.bashrc
echo "export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp" >> ~/.bashrc
echo "# export RMW_IMPLEMENTATION=rmw_gurumdds_cpp" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "alias cw='cd ~/ros_workspace/robot_ws'" >> ~/.bashrc
echo "alias cs='cd ~/ros_workspace/robot_ws'" >> ~/.bashrc
echo "alias ccd='colcon_cd'" >> ~/.bashrc
echo "alias cb='cd ~/ros_workspace/robot_ws && colcon build --symlink-install'" >> ~/.bashrc
echo "alias cbs='colcon build --symlink-install'" >> ~/.bashrc
echo "alias cbp='colcon build --symlink-install --packages-select'" >> ~/.bashrc
echo "alias cbu='colcon build --symlink-install --packages-up-to'" >> ~/.bashrc
echo "alias ct='colcon test'" >> ~/.bashrc
echo "alias ctp='colcon test --packages-select'" >> ~/.bashrc
echo "alias ctr='colcon test-result'" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "alias rsl='source ~/ros_workspace/robot_ws/install/local_setup.bash'" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "alias rt='ros2 topic list'" >> ~/.bashrc
echo "alias re='ros2 topic echo'" >> ~/.bashrc
echo "alias rn='ros2 topic node list'" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "alias killgazebo='killall -9 gazebo & killall -9 gzserver  & killall -9 gzclient'" >> ~/.bashrc
echo "" >> ~/.bashrc

source ~/.bashrc
