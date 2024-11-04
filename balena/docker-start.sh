docker run -it -v /tmp/.X11-unix/:/tmp/.X11-unix/:rw -e DISPLAY=:0 --name=container --privileged -v /src/:/ws/src/:rw balena-env bash
