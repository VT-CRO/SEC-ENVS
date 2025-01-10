## VTCRO-SEC-Jetson

This is a development environment for creating ROS applications. This environment includes GUI features for debugging and developing such as:
- gazebo
- rviz

# Prereqs 

If on a windows computer install wsl ubuntu before continuing. 

Before trying to use this workspace make sure you have the nvidia container toolkit installed and docker installed on your system.

To install Docker:
```
sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install docker.io
```

To install the nvidia container toolkit:
```
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

sudo apt-get update

sudo apt-get install -y nvidia-container-toolkit
```


# How to Build

Prerequisites:
- Docker desktop
- WSL (if windows)

Build the image using

```
docker build -t vt-cro/ros-env .
```

Before running the container, make sure to run the command `xhost +local:` on your host system (if you're on a Linux system). This will grant the container to access your host's X server, allowing you to run graphical applications such as rviz or gazebo. No further setup is needed if running with a Windows or Mac hsot.

Finally, you can run the container by running `launch.sh` shell script if you have a gpu and the `launch_no_gpu.sh` if no gpu is present in your system
Place your workspace in `./src/` and you will be able to access it within the container at `/home/ros/ws/`.

# Tips for Troubleshooting

When using `colon build' if you get and a permissions error do the following:
```
cd 

chmod 777 ws/
```

then try again.
