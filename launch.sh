#! /bin/bash

docker run -it --rm --user ros -v $PWD/src:/home/ros/ws -v /tmp/.X11-unix:/tmp/.X11-unix:rw --network=host --ipc=host --env=DISPLAY vt-cro/ros-env
