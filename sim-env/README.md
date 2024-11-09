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
