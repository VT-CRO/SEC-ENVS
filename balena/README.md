### Instructions 

To build the container 

```
docker build -t "arm" .
```

To launch container 
```
./launch.sh
```

To get into another instance of the running docker container 

```
docker exec -it arm-env bash
```

To start the container 

```
docker start arm-env
```

To stop env
```
docker stop arm-env
```

### Troubleshooting 
If rviz won't open use this command on the host machine. NOT in the container 

```
xhost +local:
```