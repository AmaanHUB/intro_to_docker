# Introduction To Containerisation And Docker

## What Is Docker?

* Open source (to an extent) platform
* Helps enable one to separate applications from the infrastructure running them
* Used to allow one to deliver software faster
* Written in Go language

### Why Docker?

* Docker is highly used within the industry, especially with the big players such as Netflix etc.

### Containers vs VMs

* Containers share the resources with the host OS as opposed to the VM creates new resources that is segregated from the host system

![](https://www.sdxcentral.com/wp-content/uploads/2019/05/ContainersvsVMs_Image.jpg)

### Demand And Future Of Docker

### Docker Commands And API

* Install using the relevant package manager
* Enable the service with:
```
systemctl enable docker.service --now
```

* You may also need to add the user to the `docker` group so that `sudo` is not needed for all the docker commands. This can be done using the following commands (in a Linux environment):
```
# create the docker group
sudo groupadd docker

# add the current user to this group
sudo usermod -aG docker $USER

# activate the changes to the groups (or can log in and out)
newgrp docker
```

* Some simple docker commands:
```
# pull an image
docker pull <image_name>

# see images that are available on host
docker images

# pull and immediately run the image, will run if already downloaded
docker run <image_name>

# with -p, it is localhost_port:docker_container_port
# the -d signifies that it is running in detached mode .i.e. we get the terminal given back to us
docker run -d -p 81:80 <image_name>

# build an image from a Dockerfile
docker build -t <image_name>

# create a new image from a container's image
docker commit <image_name>/container_id

# start a container
docker start container_id

# stop a container
docker stop container_id/name

# remove a container
docker rm container_id/name

# check running containers
docker ps

# check all containers (stopped, exited,picture running etc)
docker ps -a

# logging into a running container with bash
docker exec -it container_name bash

# logging into a running container with bash AS ROOT
docker exec -u 0 -it container_name bash
```

* One can also make the docker documentation available on our local host (in entirety):
```
docker run -d -p 4000:4000 docs/docker.github.into
```

* How docker communicates can be explained simply in this image below:
![](https://docs.docker.com/engine/images/architecture.svg)
