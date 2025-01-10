FROM osrf/ros:humble-desktop

RUN apt-get update && apt-get install -y\
  vim \
  && rm -rf /var/lib/apt/lists/*

ARG USERNAME=ros
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

RUN groupadd --gid $USER_GID $USERNAME \
  && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
  && mkdir /home/$USERNAME/.config && chown $USER_UID:$USER_GID /home/$USERNAME/.config


RUN apt-get update  \
  && apt-get upgrade -y \
  && apt-get install -y wget \
  && apt-get install -y lsb-release gnupg 

# RUN curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg

# RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null


# RUN apt-get update \
#   && apt-get -y install gz-harmonic

# Install most ROS dependencies
RUN apt-get update \
  && apt-get install -y ros-${ROS_DISTRO}-gazebo-ros-pkgs \
    ros-${ROS_DISTRO}-xacro \
    ros-${ROS_DISTRO}-joint-state-publisher-gui \
    ros-${ROS_DISTRO}-image-transport-plugins \
    ros-${ROS_DISTRO}-rqt-image-view \
    ros-${ROS_DISTRO}-ros2-control \
    ros-${ROS_DISTRO}-ros2-controllers \
    ros-${ROS_DISTRO}-gazebo-ros2-control

# Install behavior tree
RUN apt-get update && apt-get install -y \
  libzmq3-dev \
  libboost-dev \
  libboost-system-dev \
  libboost-filesystem-dev \
  libboost-thread-dev \
  libprotobuf-dev \
  protobuf-compiler \
  libmsgsl-dev\
  libgtest-dev \
  cmake

WORKDIR /tmp
RUN git clone https://github.com/BehaviorTree/BehaviorTree.CPP.git && \
  cd BehaviorTree.CPP && \
  mkdir build && cd build && \
  cmake .. && \
  make && make install

RUN apt-get update \
  && apt-get install -y sudo \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  && chmod 0440 /etc/sudoers.d/$USERNAME \
  && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

WORKDIR /home/ros/ws/

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]

RUN echo "source /opt/ros/humble/setup.bash" >> /home/ros/.bashrc
RUN echo "source /usr/share/gazebo/setup.bash" >> /home/ros/.bashrc

CMD ["bash"]

USER $USERNAME