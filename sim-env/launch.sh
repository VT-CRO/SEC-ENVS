#! /bin/bash

docker run -it --rm --user ros --name sim-env -v $PWD/src:/home/ros/ws:rw -v /tmp/.X11-unix:/tmp/.X11-unix:rw --network=host --ipc=host --env=DISPLAY --gpus all vt-cro/ros-env
