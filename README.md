# VTCRO Simulation Environment

## How To Use This Environment

This environment is used for running ROS simulations for robot pathing (or whatever else you need to do).

This environment makes use of Docker, so make sure you have it installed before trying to use this environment.
To run the development environment, you must first build it with docker using the command:

```
docker built -t [CONTAINER NAME] .
```

Before running the container, make sure to run the command `xhost +local:` on your host system (if you're on a Linux system). This will grant the container to access your host's X server, allowing you to run graphical applications such as rviz or gazebo.

Finally, you can run the container by running `docker compose up`.
Place your workspace in `./src/` and you will be able to access it within the container at `/home/ros/ws/`.
