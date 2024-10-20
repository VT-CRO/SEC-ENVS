FROM ros:melodic-ros-base

RUN apt-get update && apt-get upgrade -y && \
  apt-get install -y python3 python3-pip git build-essential python3-venv cmake usbutils doxygen

ARG USERNAME=vtcro
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

RUN groupadd --gid ${USER_GID} ${USERNAME} \
  && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
  && mkdir /home/$USERNAME/.config && chown $USER_UID:$USER_GID /home/$USERNAME/.config \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  && chmod 0440 /etc/sudoers.d/$USERNAME \
  && rm -rf /var/lib/apt/lists/*

RUN usermod -aG adm ${USERNAME}
  
RUN apt update && apt install -y \
  ros-${ROS_DISTRO}-rosserial && \
  # ros-${ROS_DISTRO}-rosserial-arduino && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /home/vtcro

USER $USERNAME
