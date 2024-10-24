FROM balenalib/aarch64-ubuntu:focal
ARG DEBIAN_FRONTEND=noninteractive

# Update Packages
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install locales && locale-gen en_US en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && export LANG=en_US.UTF-8

# Install ROS Package Keys
RUN apt-get install -y curl gnupg2 apt-transport-https gnupg ca-certificates lsb-release
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Update package repo for ROS
RUN apt-get update

# Install ROS
RUN apt-get update && apt-get install -y ros-humble-desktop ros-humble-demo-nodes-cpp ros-humble-gazebo-ros2-control-demos git
RUN apt-get install -y xfce4 xinit xserver-xorg xserver-xorg-video-fbdev xinit pciutils xfonts-100dpi xfonts-75dpi xfonts-scalable 
RUN apt-get install -y python3-argcomplete wget unzip nano vim build-essential xterm gedit firefox 

#might need this later?
#ros-humble-turtlebot3 ros-humble-turtlebot3-gazebo ros-humble-turtlebot3-msgs ros-humble-dynamixel-sdk ros-humble-turtlebot3

RUN apt-get install -y ros-humble-realsense2-camera

# Configure Enviroment for ROS
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
COPY start.sh /start.sh

WORKDIR  /tmp 
RUN git clone https://github.com/BehaviorTree/BehaviorTree.CPP.git && \
  cd BehaviorTree.CPP && \
  mkdir build && cd build && \
  cmake .. && \
  make && make install

RUN git clone https://github.com/christianrauch/apriltag_ros && \
  cd BehaviorTree.CPP && \
  mkdir build && cd build && \
  cmake .. && \
  make && make install

WORKDIR /ws


CMD ["/bin/sh", "start.sh"]