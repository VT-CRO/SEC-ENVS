## VTCRO-SEC-Jetson

This is a development environment for creating ROS applications. This environment includes GUI features for debugging and developing such as:
- gazebo
- rviz

# How to Build

Prerequisites:
- Docker desktop
- WSL (if windows)

Build the image using

```
docker build -t vt-cro/ros-env .
```

Before running the container, make sure to run the command `xhost +local:` on your host system (if you're on a Linux system). This will grant the container to access your host's X server, allowing you to run graphical applications such as rviz or gazebo. No further setup is needed if running with a Windows or Mac hsot.

Finally, you can run the container by running `docker compose up`.
Place your workspace in `./src/` and you will be able to access it within the container at `/home/ros/ws/`.

# How to Build Workspace
Navigate to the workspace (`/home/ros/ws`) and run the following commands to install all required dependencies for the ROS workspace:

```
sudo apt update
source install/setup.bash
rosdep --install-from-paths src -y --ignore-src
```

Now build the workspace. To do so, you must ensure to build the packages in the following order. The commands are as follows:
```
colcon build --package-select btcpp_ros2_interfaces
colcon build --package-select behaviortree_ros2
colcon build
```

Now source the workspace again, and the workspace is ready to use.
